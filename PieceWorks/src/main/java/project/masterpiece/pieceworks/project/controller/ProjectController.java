package project.masterpiece.pieceworks.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import project.masterpiece.pieceworks.common.Pagination;
import project.masterpiece.pieceworks.project.model.exception.ProjectException;
import project.masterpiece.pieceworks.project.model.service.ProjectService;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;
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
	@RequestMapping("pInsert.pr")
	public String pInsert(@ModelAttribute Project p) {
		
		System.out.println(p);
		
		int result = pService.insertProject(p);
		
		if(result > 0) {
			return "projectList";
		} else {
			throw new ProjectException("프로젝트 생성에 실패하였습니다.");
		}
	}
	
	// 프로젝트 목록
	@RequestMapping("pList.pr")
	public String projcetList(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Project> list =  pService.selectList(pi);

		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		} else {
			throw new ProjectException("프로젝트 목록 조회에 실패하였습니다.");
		}
		
		return "projcetList";
	}

	// 프로젝트 목록 페이지 이동
	@RequestMapping("pListView.pr")
	public String pListView() {
		return "projectList";
	}
	
	
	// 프로젝트 상세 페이지 이동
	@RequestMapping("pDetailView.pr")
	public String pDetailView() {
		return "projectDetail";
	}
	
	// 멤버 초대 페이지 이동
	@RequestMapping("inviteMemberView.pr")
	public String inviteMemberView() {
		return "inviteMember";
	}

	// 프로젝트 수정 페이지 이동
	@RequestMapping("pUpdateView.pr")
	public String pUpdateView() {
		return "projectUpdate";
	}
}

