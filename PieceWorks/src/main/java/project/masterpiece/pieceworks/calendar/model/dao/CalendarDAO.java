package project.masterpiece.pieceworks.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

@Repository("calDAO")
public class CalendarDAO {

	public int insertEvent(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.insertEvent", c);
	}

	public List<Calendar> getEventList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("calendarMapper.getEventList");
	}

	public List<Map<String, Object>> getEvents(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("calendarMapper.getEventList");
@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	public int addEvent(Calendar c) {
		
		return sqlSession.insert("calendarMapper.addEvent", c);
	}

	public ArrayList<Calendar> getEventList(Calendar c) {
		
		return (ArrayList)sqlSession.selectList("calendarMapper.getEventList", c);
	}

	public int editEvent(int cNo) {
		
		return sqlSession.update("calendarMapper.editEvent", cNo);
	}

}
