package project.masterpiece.pieceworks.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.masterpiece.pieceworks.calendar.model.exception.CalendarException;
import project.masterpiece.pieceworks.calendar.model.service.CalendarService;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calService;

	@RequestMapping("fullCal.ca")
	public String fullCal() {
		return "fullCalendar";
	}

	@RequestMapping("proCal.ca")
	public String proCalView() {
		return "calendar_p";
	}

	@RequestMapping("calendarTest.ca")
	public String testCal() {
		return "testCal";
	}

	//캘린더 테스트
	@RequestMapping("calendarTest2.ca")
	public String testCal2() {
		return "testCal2";
	}

	//캘린더 테스트
	@RequestMapping("calendarTest3.ca")
	public String testCal3() {
		return "testCal3";
	}

	//일정 추가
	@RequestMapping(value="insert.ca", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String insertEvent(@RequestParam String eventData, HttpServletRequest request) throws Exception {

		JSONParser parser = new JSONParser();
		JSONObject jObj = (JSONObject)parser.parse(eventData);

		String creator = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		String start = (String)jObj.get("start");
		String end = (String)jObj.get("end");
		String type = (String)jObj.get("type");
		String title = (String)jObj.get("title");
		String description = (String)jObj.get("description");
		String bgColor = (String)jObj.get("backgroundColor");
		Boolean allDayCheck = (Boolean)jObj.get("allDay");
		String allDay = "";

		//	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");  
		//	    Date startDate = new Date(sdf.parse(start).getTime());
		//	    Date endDate = new Date(sdf.parse(end).getTime());

		if(allDayCheck == true) {
			allDay = "Y";
		} else {
			allDay = "N";
		}

		Calendar c = new Calendar();
		c.setcCreator(creator);
		c.setcStartDate(start);
		c.setcEndDate(end);
		c.setcCategory(type);
		c.setcTitle(title);
		c.setcContent(description);
		c.setcBgColor(bgColor);
		c.setcAllday(allDay);

		System.out.println(c);

		//	   return calService.insertEvent(c);
		int result = calService.insertEvent(c);

		if(result > 0) {
			return "redirect:calendarTest3.ca";
		} else {
			throw new CalendarException("일정 추가에 실패했습니다.");
		}
	}
	
//	@RequestMapping(value="showEvent.ca", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=UTF-8")
//	public String getEventList() {
//		
//		ArrayList<Calendar> eventList = (ArrayList<Calendar>) calService.getEventList();
//		System.out.println(eventList);
//		
//		if(eventList == null) {
//			throw new CalendarException("일정 불러오기에 실패했습니다.");
//		}
//		
//		return "testCal3";
//
//	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="getEvent.ca", method = RequestMethod.POST)
	public List<Map<String, Object>> getEvents() {
		
		List<Map<String, Object>> list = calService.getEvents();
		System.out.println(list);
		
		JSONObject jObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		for(int i = 0; i < list.size(); i++) {
			hashmap.put("title", list.get(i).get("cTitle"));
			hashmap.put("start", list.get(i).get("cStartDate"));
			hashmap.put("end", list.get(i).get("cEndDate"));
			hashmap.put("type", list.get(i).get("cContent"));
			hashmap.put("backgroundColor", list.get(i).get("cBgColor"));
			
			jObj = new JSONObject(hashmap);
			jArr.add(jObj);
		}
		
		System.out.println("jsonArrCheck :" + jArr);

		return jArr;
	}
	
}
	
