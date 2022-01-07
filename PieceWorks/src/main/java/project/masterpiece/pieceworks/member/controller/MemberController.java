package project.masterpiece.pieceworks.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import project.masterpiece.pieceworks.member.model.exception.MemberException;
import project.masterpiece.pieceworks.member.model.service.MemberService;
import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt; 
	
	// 회원가입 페이지 이동
	@RequestMapping("signUpView.me")
	public String signUpView() {
		return "memberJoin";
	}
	
	// 로그인 페이지 이동
	@RequestMapping("loginView.me")
	public String loginForm() {
		return "login";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m) {
		
		// 비밀번호 암호화
		String encPwd = bcrypt.encode(m.getPwd());
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		System.out.println(bcrypt); // 암호화된 pwd
		
		if(result > 0) {
			return "redirect:loginView.me";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(Member m, Model model) {
		
		System.out.println(bcrypt); // 암호화된 pwd
		
		System.out.println(bcrypt.encode(m.getPwd()));
		
		Member loginMember = mService.memberLogin(m); 
		
		// 암호화 했을 때 로그인 
		if(bcrypt.matches(m.getPwd(), loginMember.getPwd())) {
			model.addAttribute("loginUser", loginMember);
			//상단바 우측 닉네임 테스트 때문에 임의로 commonForm으로 넘어가게 수정해뒀어요
			return "redirect:/";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	
	// 마이페이지 이동
	@RequestMapping("myPageView.me")
	public String myPageView() {
		return "myPage";
	}
	
	// 내 정보 수정 페이지 이동
	@RequestMapping("mUpdateForm.me")
	public String mUpdateForm() {
		return "mUpdateForm";
	}
	
	// 내 정보 수정 
	@RequestMapping("mUpdate.me")
	public String updateMember(@ModelAttribute Member m, Model model) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:myPageView.me";
		} else {
			throw new MemberException("회원정보 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("mdelete.me")
	public String deleteMember(@RequestParam("email")String email, SessionStatus session){
	
		int result = mService.deleteMember(email);
		
		if(result > 0) {
			session.setComplete();
			return "redirect:loginView.me";
		} else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	// 이메일 찾기 페이지 이동
	@RequestMapping("fEmailView.me")
	public String forgotEmailForm(){
		return "forgotEmail";
	}
	
	// 이메일 찾기
//	@RequestMapping(value="fEamil.me", method=RequestMethod.POST)
//	public String findEmail(Member m, Model model) {
//		
//		Member findMember = mService.findEmail(m);
//		
//		
//		return "findEmail";
//	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping("fPwdView.me")
	public String forgotPwdForm() {
		return "forgotPwd";
	}
	
	// 비밀번호 찾기(인증번호) 페이지 이동
	@RequestMapping("fPwdCode.me")
	public String findPwdCodeForm() {
		return "findPwdCode";
	}
	
	

	
	
	
}
