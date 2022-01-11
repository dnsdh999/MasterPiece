package project.masterpiece.pieceworks.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	@RequestMapping("sEmailView.me")
	public String forgotEmailForm(){
		return "searchEmail";
	}

	
	// 이메일 찾기
	@RequestMapping("sEamil.me")
	public String findEmail(Member m, Model model) {
		
		Member findeMember = mService.searchEmail(m);
		
		System.out.println(m);
		System.out.println(findeMember);
		
		if(findeMember != null) {
			model.addAttribute("email", findeMember.getEmail());
		} else {
			throw new MemberException("이메일 찾기에 실패하였습니다.");
		}
		return "resultEmail";
	}
	
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping("sPwdView.me")
	public String searchPwdForm() {
		return "searchPwd";
	}
	
	// 메일 전송
	public void sendEmail(String email, int random) {
		
		String subject = "[MasterPiece] 이메일 인증번호 입니다.";
		String content = "<div style='text-align:center;'>"
							+ "<h1>인증번호<h1><br><hr style='width: 50%;'>"
							+ "<h3>안녕하십니까. MasterPiece입니다.<h3><br>"
							+ "<div style='text-align:center;'>요청하신 인증번호는<b>"+ random +"</b>입니다.</div>"
							+ "진행 중인 화면으로 돌아가 인증번호를 입력해주세요."
							+ "<br><hr style='width: 50%;'><br>"
							+ "MasterPiece를 이용해 주셔서 감사합니다.</div>";
		String from = "wjddms0700@gmail.com";
		String to = email;
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			mailSender.send(mail);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 비밀번호 인증번호 메일 보내기
	@RequestMapping("sPwd.me")
	public ModelAndView searchPwd(@ModelAttribute Member m , ModelAndView mv) {
		
		Member member = mService.searchPwd(m);
			
		if(member == null) {
			throw new MemberException("일치하는 회원 정보가 없습니다.");
		} 
		int random =  (int)(Math.random() * 1000000) + 1;
		sendEmail(member.getEmail(), random);
			
		mv.addObject("random", random);
		mv.addObject("email", m.getEmail());
		mv.setViewName("pwdCode");
			
		return mv;
	}
	
	// 인증번호
	@RequestMapping("pwdCode.me")
	public ModelAndView pwdCode(@RequestParam("email") String email, ModelAndView mv) {
		mv.addObject("email", email);
		mv.setViewName("updatePwd");
		
		return mv;
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="updatePwd.me", method=RequestMethod.POST)
	public String updatePwd(@ModelAttribute Member m, HttpSession session) {
		
		m.setPwd(bcrypt.encode(m.getPwd()));
		
		int result = mService.updatePwd(m);
		
		if(result > 0) {
			return "redirect:loginView.me";
		} else {
			throw new MemberException("비밀번호 재설정에 실패하였습니다.");
		}
	}
}
