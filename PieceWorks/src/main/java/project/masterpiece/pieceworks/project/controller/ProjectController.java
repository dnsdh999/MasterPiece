package project.masterpiece.pieceworks.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.exception.ProjectException;
import project.masterpiece.pieceworks.project.model.service.ProjectService;
import project.masterpiece.pieceworks.project.model.vo.JoinProject;
import project.masterpiece.pieceworks.project.model.vo.Project;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	// 프로젝트 생성 페이지 이동
	@RequestMapping("pInsertView.pr")
	public String pInserView() {
		return "projectInsert";
	}
	
	// 프로젝트 생성
	@RequestMapping(value="pInsert.pr", method={RequestMethod.GET, RequestMethod.POST})
	public String pInsert(@ModelAttribute Project p) {

		System.out.println(p);
//			System.out.println(p);

			int result = pService.insertProject(p);

			if(result > 0) {
				pService.insertPrJoin(p);
				return "redirect:main.com";
			} else {
				throw new ProjectException("프로젝트 생성에 실패하였습니다.");
			}
		}
		
//		System.out.println(p);
		
	// 프로젝트 상세 페이지 이동
//	@RequestMapping("pDetailView.pr")
//	public String pDetailView() {
//		return "projectDetail";
//	}
		
	// 프로젝트 상세 페이지 이동
	@RequestMapping("pDetailView.pr")
	public ModelAndView pDetailView(ModelAndView mv) {
		//클릭한 프로젝트 번호 받아오기
		int projectNo = 0; //임시 프로젝트 번호
		ArrayList<Member> list = new ArrayList<Member>();
		list = pService.MemberProjectList(projectNo);
		ArrayList<Member> notMemberlist = new ArrayList<Member>();
		notMemberlist = pService.notMemberProjectlist(projectNo);
		System.out.println(list);
		if(list !=null) {
			mv.addObject("projectNo",projectNo);
			mv.addObject("list",list);
			mv.addObject("notMemberlist",notMemberlist);
			mv.setViewName("projectDetail");
		}else {
			throw new ProjectException("프로젝트 디테일에 실패하였습니다.");
		}
		return mv;
	}

	// 프로젝트 수정 페이지 이동
	@RequestMapping("pUpdateView.pr")
	public String pUpdateView() {
		return "projectUpdate";
	}
	
	// 메인화면에 프로젝트 목록 불러오기
	@RequestMapping("pList.pr")
	public void getPList(HttpSession session, HttpServletResponse response, Model model) {
			
		Member loginUser = (Member)session.getAttribute("loginUser");
		String email = loginUser.getEmail();

		ArrayList<Project> list = pService.getPList(email);

		System.out.println(list);

//		System.out.println(list);
		
		response.setContentType("application/json; charset=UTF-8");

		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			
		model.addAttribute("list", list);
			
		Gson gson = gb.create();
			
//		Gson gson = new Gson();
			
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 멤버 초대 페이지 이동
	@RequestMapping("invite.pr")
	public String inviteView() {
		return "inviteMember";  
	}
	
	// 프로젝트 상세 페이지 이동
	@RequestMapping("pDetailView2.pr")
	public String pDetailView2(@RequestParam("pNo") int projectNo, Model model,
								HttpSession session) {
//		System.out.println(projectNo);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		loginUser.setCurrPno(projectNo);

		ArrayList<Project> list = pService.selectProject(projectNo);

		if(list != null) {
			model.addAttribute("list", list);
			return "projectDetail2";
		} else {
			throw new ProjectException("프로젝트 상세 조회에 실패하였습니다.");
		}
	}
	
	// 프로젝트 상세 페이지 이동2
		@RequestMapping("pDetailViewBack.pr")
		public String pDetailViewBack(Model model, HttpSession session) {
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			int projectNo = loginUser.getCurrPno();

			ArrayList<Project> list = pService.selectProject(projectNo);

			if(list != null) {
				model.addAttribute("list", list);
				return "projectDetail2";
			} else {
				throw new ProjectException("프로젝트 상세 내역으로 되돌아 가기에 실패하였습니다.");
			}
		}
	
	// 프로젝트 캘린더로 이동
	@RequestMapping("fullCal.ca")
	public String fullCalView(/*@RequestParam("pNo") int pNo,*/HttpSession session, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		int pNo = loginUser.getCurrPno();
		System.out.println("calendar pNo : " + pNo);
		ArrayList<Project> list = pService.selectProject(pNo);

		if(list != null) {
			model.addAttribute("list", list);
			return "fullCalendar";
		} else {
			throw new ProjectException("프로젝트 캘린더 조회에 실패하였습니다.");
		}
	}
	
	// 프로젝트 상세 일정 목록 조회
	@RequestMapping("getDetail.pr")
	public void getDetailList(@RequestParam("pNo") int pNo, HttpServletResponse response) {


		ArrayList<Calendar> list = pService.selectCalendar(pNo);

		response.setContentType("application/json; charset=UTF-8");

//		System.out.println(list);

		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");

		Gson gson = gb.create();

		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	// 프로젝트 상세 일정 완료로 수정하기
	@RequestMapping("finished.pr")
	public void finishedDetail(@RequestParam("chkBox") int cNo) {
		System.out.println(cNo);
	}
	//프로젝트 상세페이지 유저 검색
		@RequestMapping("emailSearch")
		public void emailSearch(@RequestParam("email") String email,@RequestParam("projectNo") int projectNo, HttpServletResponse response, Model model) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("projectNo", projectNo);
			ArrayList<Member> list = new ArrayList<Member>();
			if(email!=null) {
			list = pService.emailSearch(map);
			
			
			model.addAttribute("list", list);
			}else {
				list = pService.MemberProjectList(projectNo);
			}
			
			response.setContentType("application/json; charset=UTF-8");
				
			Gson gson = new Gson();
			try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		@RequestMapping("addProjectMember")
		public ModelAndView addProjectMember(@RequestParam("email") String[] email,@RequestParam("projectNo") int projectNo,ModelAndView mv) {
			System.out.println(email);
			System.out.println(projectNo);
			ArrayList<JoinProject> list1 = new ArrayList<JoinProject>();
			JoinProject j = new JoinProject();
			for (String s : email) {
				j.setpMember(s);
				j.setProjectNo(projectNo);
				list1.add(j);
			}
			
			
			int result = pService.addProjectMember(list1);
			if(result >0) {
				 mv.setViewName("redirect:pDetailView.pr"); 
			/*	ArrayList<Member> list = new ArrayList<Member>();
				list = pService.MemberProjectList(projectNo);
				ArrayList<Member> memberlist = new ArrayList<Member>();
				memberlist = pService.notMemberProjectlist(projectNo);
				response.setContentType("application/json; charset=UTF-8");
				
				Gson gson = new Gson();
				try {
					gson.toJson(list, response.getWriter());
					gson.toJson(memberlist, response.getWriter());
					
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}*/
				
			}else {
				throw new ProjectException("프로젝트 초대에 실패하였습니다.");
			}
			
			return mv;
		}
	
}

