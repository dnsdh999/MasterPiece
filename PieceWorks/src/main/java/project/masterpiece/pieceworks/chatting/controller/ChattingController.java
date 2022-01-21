package project.masterpiece.pieceworks.chatting.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.chatting.model.ChattingException;
import project.masterpiece.pieceworks.chatting.model.service.ChattingService;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingAddMember;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingCheckRoom;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("today")
@Controller
public class ChattingController {
	private boolean isCreate = false;
	private int chatRoomNum = 0;
	@Autowired
	private ChattingService cService;
	
	
	@RequestMapping("chattest.ch")
	public String read() {
		return "chattingTest";
	}
	
	@RequestMapping("chatForm.ch")
	public String chatForm() {
		return "chattingForm";
	}


	@RequestMapping("chatList.ch")
	public String chatList(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		java.util.Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = simpleDateFormat.format(date);
        java.sql.Date sqlDate = null;
         String[] dateArr = formattedDate.split("-");
         int year = Integer.parseInt(dateArr[0]);
         int month = Integer.parseInt(dateArr[1])-1;
         int day = Integer.parseInt(dateArr[2]);
         
         sqlDate = new java.sql.Date(new GregorianCalendar(year,month,day).getTimeInMillis());
         int projectNum = loginUser.getCurrPno();
         ArrayList<Member> mArr = new ArrayList<Member>();
         
         mArr = cService.selectProjectMemList(projectNum);
        
         model.addAttribute("isCreate", isCreate);
         model.addAttribute("chatRoomNum", chatRoomNum);
         model.addAttribute("mArr", mArr);
         isCreate = false;	chatRoomNum = 0;
         model.addAttribute("today", sqlDate);
         
         
         return "chattingList";
	}
	
	@RequestMapping("getChatList.ch")
	public void getChatList(HttpServletRequest request, HttpServletResponse response, Model model) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Member m = new Member();
		m.setCurrPno(loginUser.getCurrPno());
		m.setEmail(loginUser.getEmail());
		
		ArrayList<ChattingList> list = new ArrayList<ChattingList>();
		list = cService.selectChattingList(m);
		
		if(list != null) {
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			
			Gson gson = gb.create();
			try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			throw new ChattingException("채팅목록 불러오기 실패");
		}
	}
	
	@RequestMapping("chattingInvite.ch")
	public String chattingInvite(HttpServletRequest request,
										@RequestParam("emails") String emails,
										@RequestParam("roomName") String roomName,
										@RequestParam("memberNames") String memberNames,
										Model model) {
		
		String userEmail = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		int currPno = ((Member)request.getSession().getAttribute("loginUser")).getCurrPno();
		int projectNo = currPno;	//프로젝트 구현되고 수정할 부분
		System.out.println(memberNames);
		ChattingInvite ci = new ChattingInvite(userEmail, roomName, projectNo);
		int result = cService.insertChatRoom(ci);
		
		if(result>0) {
			
			String[] email = emails.split(",");
			ArrayList<String> eList = new ArrayList<String>(Arrays.asList(email));
			
			int jResult = cService.insertChatJoin(eList);
			
			if(jResult > 0) {
				String[] memberNameArr = memberNames.split(",");
				ArrayList<String> mNameList = new ArrayList<String>(Arrays.asList(memberNameArr));
				
				String firstMessage = ((Member)request.getSession().getAttribute("loginUser")).getNickName() + "님이 ";
				
				for(int i = 0; i<mNameList.size()-1; i++) {
					if(i!=mNameList.size()-2) {
						firstMessage += mNameList.get(i) + "님, ";
					}
					if(i==mNameList.size()-2) {
						firstMessage += mNameList.get(i) + "님을 초대했습니다.";
					}
				}
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("firstMessage", firstMessage);
				map.put("creator", userEmail);
				
				int megResult = cService.insertFirstMeg(map);
				
				if(megResult > 0) {
					isCreate = true;
					chatRoomNum = cService.getRoomNum();
					return "redirect:chatList.ch";
				}else {
					throw new ChattingException("실패하였습니다.");
				}
			}else {
				throw new ChattingException("실패하였습니다.");
			}
		}else {
			throw new ChattingException("실패하였습니다.");
		}
		

	}
	
	@RequestMapping("updateChatTitle.ch")
	public ModelAndView updateChatTitle(@RequestParam("chatNo") int chatNo,
										@RequestParam("chatTitle") String chatTitle,
										ModelAndView mv) {
		ChattingList cl = new ChattingList();
		cl.setChatNo(chatNo);
		cl.setChatTitle(chatTitle);
		
		int result = cService.updateChatTitle(cl);
		if(result>0) {
			mv.setViewName("redirect:chatList.ch");
		}else {
			throw new ChattingException("실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("chatRoomOut.ch")
	public ModelAndView chatRoomOut(@RequestParam("chatNo") int chatNo,
									@RequestParam("userEmail") String userEmail,
									@RequestParam("nickName") String nickName,
									ModelAndView mv) {
		
		ChattingMessage cm = new ChattingMessage();
		cm.setChatNo(chatNo);
		cm.setChatWriter(userEmail);
		cm.setChatMessage(nickName + "님이 채팅방을 퇴장하였습니다.");
		

		int msgResult = cService.insertOutMeg(cm);
		
		if(msgResult > 0) {
			int result = cService.chatRoomOut(cm);
			if(result>0) {
				mv.setViewName("redirect:chatList.ch");
				int joinMemberCount = cService.joinMemberCount(chatNo);
				if(joinMemberCount == 0) {
					int dResult = cService.deleteRoom(chatNo);
					if(dResult > 0) {
						System.out.println("0인 남아 채팅방 삭제");
					}
				}
			}else {
				throw new ChattingException("실패하였습니다.");
			}
		}else {
			throw new ChattingException("실패하였습니다.");
		}
		return mv;
	}
	
	
	@RequestMapping("deleteRoom.ch")
	public ModelAndView deleteRoom(@RequestParam("chatNo") int chatNo, ModelAndView mv) {
		int jmDeleteResult = cService.deleteChatJoinMem(chatNo);
		
		if(jmDeleteResult > 0) {
			int result = cService.deleteRoom(chatNo);
			if(result>0) {
				mv.setViewName("redirect:chatList.ch");
			}else {
				throw new ChattingException("실패하였습니다.");
			}
		}else {
			throw new ChattingException("실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("updateConfirmTime.ch")
	public void confirmTimeSet(@RequestParam("chatNo") int chatNo,
								HttpServletRequest request, HttpServletResponse response, Model model) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		ChattingMessage cm = new ChattingMessage();
		cm.setChatNo(chatNo);
		cm.setChatWriter(email);
		
		int result = cService.updateConfirmTime(cm);
		try {
			PrintWriter out = response.getWriter();
			
			if(result > 0) {
				out.println("ok");
			}else {
				out.println("fail");
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getPChatAlarmCount.ch")
	public void getPChatAlarmCount(HttpServletRequest request, HttpServletResponse response, Model model,
								@RequestParam("projectNo") int projectNo) {
		int count = 0;
		
		String userEmail = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		
		Member m = new Member();
		m.setEmail(userEmail);
		m.setCurrPno(projectNo);
		count = cService.getPChatAlarmCount(m);
		
		
		try {
			PrintWriter out = response.getWriter();
			
			out.println(count);
			
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("chattingDetailForm.ch")
	public ModelAndView chattingDetailForm(@ModelAttribute ChattingMessage c,ModelAndView mv) {
	
		/*public ModelAndView chattingDetailForm(@RequestParam("chatWriter") String chatWriter,
		@RequestParam("anotherUserId") String anotherUserId,@RequestParam("chatNo") int chatNo,ModelAndView mv) {*/
	/*채팅 메세지 불러오기
	 채팅방 번호 , 본인 아이디, 클릭 한 채팅 아이디 가져오기*/
	/*
	 * HashMap<Object, Object> map = new HashMap<Object, Object>();
	 * map.put("chatWriter", chatWriter); map.put("anotherUserId", anotherUserId);
	 * map.put("chatNo", chatNo);
	 */
	
	
	ArrayList<ChattingMessage> list = new ArrayList<ChattingMessage>();
	list = cService.selectChattingMessageList(c);
	
	int projectNo = cService.selectProjectNo(c.getChatNo());
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("projectNo", projectNo);
	map.put("chatNo", c.getChatNo());
	ArrayList<ChattingAddMember> memberList = new ArrayList<ChattingAddMember>();
	memberList = cService.cAddMemberList(map);
	System.out.println(memberList);
	if(list != null) {
		mv.addObject("chatNo",c.getChatNo());
		mv.addObject("userId",c.getChatWriter());
		mv.addObject("memberList",memberList);
		mv.addObject("list",list);
		mv.setViewName("chattingDetailForm");
	}else {
		throw new ChattingException("게시글 전체 조회에 실패하였습니다.");
	}
	return mv;
}
	
	@RequestMapping("addChatRoomMember.ch")
	public ModelAndView cAddMemberList(@RequestParam("userEmail") String userEmail,@RequestParam("chatNo") String chatNo,
										@RequestParam("userId") String userId , HttpServletResponse response,ModelAndView mv) {
		String[] addEmail = userEmail.split(",");
		
		ArrayList<ChattingCheckRoom> list = new ArrayList<ChattingCheckRoom>();
		
		for (String s : addEmail) {
			ChattingCheckRoom c = new ChattingCheckRoom();
			 c.setUserUuid(s);
			 c.setChatNo(chatNo);
			 list.add(c);
			 
		}

		
		
		  int result = cService.insertChattingMember(list);
		  if(result>0) {
			  mv.setViewName("redirect:chattingDetailForm.ch?chatNo="+chatNo + "&chatWriter="+userId); 
		  }
		  else { 
			  throw new ChattingException("초대 실패"); 
		  }
		  return mv;
		 
		
		
		
	}
}
