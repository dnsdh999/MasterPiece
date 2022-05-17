package project.masterpiece.pieceworks.calendar.controller;


import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.calendar.model.service.CalendarService;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.service.ProjectService;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;
import project.masterpiece.pieceworks.project.model.vo.Project;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService caService;
	
	@Autowired
	private ProjectService pService;

	@RequestMapping("proCal.ca")
	public String proCalView() {
		return "calendar_p";
	}
	
	@RequestMapping(value="addEvent.ca", produces="application/json; charset=UTF-8")
	@ResponseBody
	public int addEvent(@RequestParam("eventData") String eventData, 
						HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		JSONParser parser = new JSONParser();
		JSONObject jObj = (JSONObject)parser.parse(eventData);
		String title = (String)jObj.get("title");
		String start = (String)jObj.get("start");
		String end = (String)jObj.get("end");
		String description = (String)jObj.get("description");
		String type = (String)jObj.get("type");
		String bgColor = (String)jObj.get("backgroundColor");
		Boolean allDayCheck = (Boolean)jObj.get("allDay");
		String allDay = "";
//		String projectNo = (String) jObj.get("projectNo");
		String projectNo = Integer.toString(loginUser.getCurrPno());
		
		Calendar c = new Calendar();
		c.setcCreator(loginUser.getEmail());
		c.setCalTitle(title);
		c.setcStartDate(start);
		c.setcEndDate(end);
		c.setCategory(type);
		c.setCalContent(description);
		c.setBgColor(bgColor);
		c.setProjectNo(projectNo);

		
		if(allDayCheck == true) {
			allDay = "Y";
		} else if(allDayCheck == null || allDayCheck == false){
			allDay = "N";
		}
		
		c.setAllDay(allDay);
		
//		System.out.println("controller : " + c);
		
		return caService.addEvent(c);
		
	}
	
	@RequestMapping("eventList.ca")
	public void getEventList(@RequestParam("startDate") String startDate,
							   @RequestParam("endDate") String endDate,
							   @RequestParam("projectNo") String projectNo,
							   Model model,
							   HttpServletResponse response) {
		
		Calendar c = new Calendar();
		
		c.setcStartDate(startDate);
		c.setcEndDate(endDate);
		c.setProjectNo(projectNo);
		
		//이벤트 리스트 가져오기 전에 프로시저 실행(end_date가 오늘날짜보다 전인것은 완료처리)
		ArrayList<Calendar> pList = caService.callProcedure(); 
		
		ArrayList<Calendar> list = caService.getEventList(c);
		
		model.addAttribute("list", list);
		
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
	
	 @RequestMapping(value="editEvent.ca", produces="application/json; charset=UTF-8")
	 @ResponseBody
	 public void editEvent(@RequestParam("updateData") String updateData, Model model, HttpServletRequest request) throws Exception {
	      
	      HttpSession session = request.getSession();
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      
	      JSONParser parser = new JSONParser();
	      JSONObject jObj = (JSONObject)parser.parse(updateData);
	      int id = Integer.parseInt(String.valueOf(jObj.get("id")));
	      String title = (String)jObj.get("title");
	      String start = (String)jObj.get("start");
	      String end = (String)jObj.get("end");
	      String description = (String)jObj.get("description");
	      String type = (String)jObj.get("type");
	      String bgColor = (String)jObj.get("backgroundColor");
	      Boolean allDayCheck = (Boolean)jObj.get("allDay");
	      String allDay = "";
	      if(allDayCheck == true) {
	         allDay = "Y";
	      } else {
	         allDay = "N";
	      }
	      String projectNo = Integer.toString(loginUser.getCurrPno());
	      
	      Calendar c = new Calendar();
	      
	      c.setCalendarNo(id);
	      c.setcCreator(loginUser.getEmail());
	      c.setCalTitle(title);
	      c.setcStartDate(start);
	      c.setcEndDate(end);
	      c.setCategory(type);
	      c.setCalContent(description);
	      c.setBgColor(bgColor);
	      c.setAllDay(allDay);
	      c.setProjectNo(projectNo);
	      
	      int result = caService.editEvent(c);
	      
	      model.addAttribute("Calendar", c);
	      
//	      System.out.println(c);
	      
	 }
	   
	
	@RequestMapping(value="deleteEvent.ca", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteEvent(@RequestParam("removeData") String removeData, HttpServletRequest request, Model model) throws ParseException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		JSONParser parser = new JSONParser();
		JSONObject jObj = (JSONObject)parser.parse(removeData);
		int id = Integer.parseInt(String.valueOf(jObj.get("id")));
		String title = (String)jObj.get("title");
	    String start = (String)jObj.get("start");
	    String end = (String)jObj.get("end");
	    String description = (String)jObj.get("description");
	    String type = (String)jObj.get("type");
	    String bgColor = (String)jObj.get("backgroundColor");
	    Boolean allDayCheck = (Boolean)jObj.get("allDay");
	    String allDay = "";
	    if(allDayCheck == true) {
	    	allDay = "Y";
		} else {
			allDay = "N";
		}
	    String projectNo = Integer.toString(loginUser.getCurrPno());
	    
	    Calendar c = new Calendar();
	    
	    c.setCalendarNo(id);
	    c.setcCreator(loginUser.getEmail());
	    c.setCalTitle(title);
	    c.setcStartDate(start);
	    c.setcEndDate(end);
	    c.setCategory(type);
	    c.setCalContent(description);
	    c.setBgColor(bgColor);
	    c.setAllDay(allDay);
	    c.setProjectNo(projectNo);
	    
	    int result = caService.deleteEvent(c);
	      
	    model.addAttribute("Calendar", c);
	     
//	    System.out.println(c);
		
	}
	
	@RequestMapping("mainCalendar.com")
	public void getProjectList(@RequestParam("startDate") String startDate,
								@RequestParam("endDate") String endDate,
								HttpSession session, HttpServletResponse response,
								Model model) {
		
		//세션에서 email받아옴
		Member loginUser = (Member)session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		
		//JSON에 담기위해 시작일, 종료일의 자료형이 String인 객체 추가 생성
		MainCalProject mp = new MainCalProject();
		mp.setpStartDate(startDate);
		mp.setpEndDate(endDate);
		mp.setpCreater(email);
		
		//이벤트 리스트 가져오기 전에 프로시저 실행(오늘날짜 기준으로 진행중 또는 완료 처리)
		ArrayList<MainCalProject> pListStart = caService.callProcedureForMain1(); 
		ArrayList<MainCalProject> pListEnd = caService.callProcedureForMain2(); 
		
		ArrayList<MainCalProject> pList2= pService.getPListForMain2(mp);
//		System.out.println("pList2 : " + pList2);
		
		response.setContentType("application/json; charset=UTF-8");
		model.addAttribute("pList2", pList2);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		
		try {
			gson.toJson(pList2, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
