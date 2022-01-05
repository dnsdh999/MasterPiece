package project.masterpiece.pieceworks.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

@Repository("calDAO")
public class CalendarDAO {

	public int insertEvent(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.insertEvent", c);
	}

}
