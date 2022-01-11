package project.masterpiece.pieceworks.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
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
	}

}
