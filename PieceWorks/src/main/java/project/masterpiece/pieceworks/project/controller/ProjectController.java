package project.masterpiece.pieceworks.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.exception.ProjectException;
import project.masterpiece.pieceworks.project.model.service.ProjectService;
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
		
		int result = pService.insertProject(p);
		
		if(result > 0) {
			pService.insertPrJoin(p);
			return "redirect:main.com";
		} else {
			throw new ProjectException("프로젝트 생성에 실패하였습니다.");
		}
	}
	
	// 프로젝트 상세 페이지 이동
	@RequestMapping("pDetailView.pr")
	public String pDetailView() {
		return "projectDetail";
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
	public String pDetailView2(@RequestParam("pNo") int projectNo, Model model) {
		System.out.println(projectNo);
		
		Project p = pService.selectProject(projectNo);
		
		
		if(p != null) {
			model.addAttribute("p", p);
			return "projectDetail2";
		} else {
			throw new ProjectException("프로젝트 상세 조회에 실패하였습니다.");
		}
	}
	
	// 프로젝트 캘린더로 이동
	@RequestMapping("fullCal.ca")
	public String fullCalView() {
		return "fullCalendar";
	}
	
}

