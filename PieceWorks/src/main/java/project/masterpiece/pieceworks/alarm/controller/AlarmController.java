package project.masterpiece.pieceworks.alarm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.alarm.model.AlarmException;
import project.masterpiece.pieceworks.alarm.model.service.AlarmService;
import project.masterpiece.pieceworks.alarm.model.vo.Alarm;
import project.masterpiece.pieceworks.chatting.model.ChattingException;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService aService;
	
	@RequestMapping("getAlarmCount.al")
	public void getAlarmCount(HttpServletRequest request, HttpServletResponse response, Model model
							 ,@RequestParam("projectNo") int projectNo) {
		int count = 0;
		
		String userEmail = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		if(projectNo == 0) {
			count = aService.getAllAlarmCount(userEmail);
		}else {
			Member m = new Member();
			m.setEmail(userEmail);
			m.setCurrPno(projectNo);
			count = aService.getProjectAlarmCount(m);
		}
		
		try {
			PrintWriter out = response.getWriter();
			
			out.println(count);
			
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getAlarmList.al")
	public void getAlarmList(HttpServletRequest request, HttpServletResponse response, Model model
							,@RequestParam("projectNo") int projectNo) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		
		ArrayList<Alarm> list = new ArrayList<Alarm>();
		
		if(projectNo == 0) {
			list = aService.getAllAlarmList(email);
		}else {
			Member m = new Member();
			m.setCurrPno(projectNo);
			m.setEmail(email);
			list = aService.getProjectAlarmList(m);
		}
		
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
			throw new ChattingException("알림목록 불러오기 실패");
		}
	}
	
	@RequestMapping("allAlarmList.al")
	public String allAlarmList(HttpServletRequest request, Model model) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		int currPno = ((Member)request.getSession().getAttribute("loginUser")).getCurrPno();
		
		ArrayList<Alarm> list = new ArrayList<Alarm>();
		
		if(currPno == 0) {
			list = aService.getAlarmListForPage(email);
		}else {
			Member m = new Member();
			m.setCurrPno(currPno);
			m.setEmail(email);
			list = aService.getPAListForPage(m);
		}
		
		if(list != null) {
			model.addAttribute("aList", list);
		}else {
			throw new AlarmException("채팅목록 불러오기 실패");
		}
		
		return "alarmList";
	}
	
	
	
	@RequestMapping("updateAlarmStatus.al")
	public String updateAlarmStatus(@RequestParam("alarmNo") String alarmNo, HttpServletRequest request, Model model ) {
		
		int aNo = Integer.parseInt(alarmNo);
		int result = aService.updateAlarmStatus(aNo);		
		if(result > 0) {
			return "redirect:allAlarmList.al";
		}else {
			throw new AlarmException("채팅목록 불러오기 실패");
		}
		
	}
	
	@RequestMapping("updateAllAlarmStatus.al")
	public String updateAllAlarmStatus(HttpServletRequest request, Model model) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		int currPno = ((Member)request.getSession().getAttribute("loginUser")).getCurrPno();
		
		Member m = new Member();
		m.setCurrPno(currPno);
		m.setEmail(email);
		
		int result = aService.updateAllAlarmStatus(m);
		if(result > 0) {
			return "redirect:allAlarmList.al";
		}else {
			throw new AlarmException("채팅목록 불러오기 실패");
		}
	}
}
