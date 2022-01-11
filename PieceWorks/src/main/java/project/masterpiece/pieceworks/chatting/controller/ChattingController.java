package project.masterpiece.pieceworks.chatting.controller;



import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("today")
@Controller
public class ChattingController {

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
	public String chatList(Model model) {
		java.util.Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = simpleDateFormat.format(date);
        java.sql.Date sqlDate = null;
         String[] dateArr = formattedDate.split("-");
         int year = Integer.parseInt(dateArr[0]);
         int month = Integer.parseInt(dateArr[1])-1;
         int day = Integer.parseInt(dateArr[2]);
         
         sqlDate = new java.sql.Date(new GregorianCalendar(year,month,day).getTimeInMillis());
	      
         
         
         model.addAttribute("today", sqlDate);
         
         
         return "chattingList";
	}
	
	@RequestMapping("getChatList.ch")
	public void getChatList(HttpServletRequest request, HttpServletResponse response, Model model) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		ArrayList<ChattingList> list = new ArrayList<ChattingList>();
		list = cService.selectChattingList(email);
		
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
	public ModelAndView chattingInvite(HttpServletRequest request,
										@RequestParam("emails") String emails,
										@RequestParam("roomName") String roomName,
										@RequestParam("memberNames") String memberNames,
										ModelAndView mv) {
		
		String userEmail = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		int projectNo = 1000;	//프로젝트 구현되고 수정할 부분
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
				
				for(int i = 0; i<mNameList.size(); i++) {
					if(i!=mNameList.size()-1) {
						firstMessage += mNameList.get(i) + "님, ";
					}
					if(i==mNameList.size()-1) {
						firstMessage += mNameList.get(i) + "님을 초대했습니다.";
					}
				}
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("firstMessage", firstMessage);
				map.put("creator", userEmail);
				
				int megResult = cService.insertFirstMeg(map);
				
				if(megResult > 0) {
					mv.setViewName("redirect:chatList.ch");
				}else {
					throw new ChattingException("실패하였습니다.");
				}
			}else {
				throw new ChattingException("실패하였습니다.");
			}
		}else {
			throw new ChattingException("실패하였습니다.");
		}
		
		return mv;
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

	if(list != null) {
		mv.addObject("chatNo",c.getChatNo());
		mv.addObject("userId",c.getChatWriter());
		mv.addObject("list",list);
		mv.setViewName("chattingDetailForm");
	}else {
		throw new ChattingException("게시글 전체 조회에 실패하였습니다.");
	}
	return mv;
}
	
	
}
