package project.masterpiece.pieceworks;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class CommonController {

	@RequestMapping("common.com")
	public String test() {
		return "common-form";
	}	
	
	@RequestMapping("project.com")
	public String test2() {
		return "project-common-form";
	}
	
	@RequestMapping("main.com")
	public String main(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		loginUser.setCurrPno(0);
		return "main";
	}
	
}
