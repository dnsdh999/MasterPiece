package project.masterpiece.pieceworks.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.calendar.model.dao.CalendarDAO;
import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;

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
	public int editEvent(Calendar c) {
		return cDAO.editEvent(c);
	}
	
	@Override
	public int deleteEvent(Calendar c) {
		return cDAO.deleteEvent(c);
	}

	@Override
	public ArrayList<Calendar> callProcedure() {
		return cDAO.callProcedure();
	}

	@Override
	public ArrayList<MainCalProject> callProcedureForMain1() {
		return cDAO.callProcedureForMain1();
	}

	@Override
	public ArrayList<MainCalProject> callProcedureForMain2() {
		return cDAO.callProcedureForMain2();
	}

}
