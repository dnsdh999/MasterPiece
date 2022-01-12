package project.masterpiece.pieceworks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String main() {
		return "main";
	}
	
}
