package project.masterpiece.pieceworks.calendar.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.calendar.model.dao.CalendarDAO;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

@Service("calService")
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO calDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertEvent(Calendar c) {
		return calDAO.insertEvent(sqlSession, c);
	}

	@Override
	public List<Calendar> getEventList() {
		return calDAO.getEventList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> getEvents() {
		return calDAO.getEvents(sqlSession);
	}
@Service("caService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDAO cDAO;

	@Override
	public int addEvent(Calendar c) {
		
		return cDAO.addEvent(c);
	}

	@Override
	public ArrayList<Calendar> getEventList(Calendar c) {
		
		return cDAO.getEventList(c);
	}

	@Override
	public int editEvent(int cNo) {
		
		return cDAO.editEvent(cNo);
	}
	

}
