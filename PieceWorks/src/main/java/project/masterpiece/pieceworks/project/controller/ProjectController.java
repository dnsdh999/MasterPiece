package project.masterpiece.pieceworks.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
}

