package project.masterpiece.pieceworks.calendar.model.service;

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

}
