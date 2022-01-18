package project.masterpiece.pieceworks.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

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

	public int editEvent(Calendar c) {
		return sqlSession.update("calendarMapper.editEvent", c);
	}
	
	public int deleteEvent(Calendar c) {
		return sqlSession.update("calendarMapper.deleteEvent", c);
	}

	public ArrayList<Calendar> callProcedure() {
		return sqlSession.selectOne("calendarMapper.callProcedure");
	}
}
