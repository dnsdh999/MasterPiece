package project.masterpiece.pieceworks.calendar.model.service;

import java.sql.Date;
import java.util.ArrayList;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;

public interface CalendarService {

	int addEvent(Calendar c);

	ArrayList<Calendar> getEventList(Calendar c);

	int editEvent(Calendar c);
	
	int deleteEvent(Calendar c);

	ArrayList<Calendar> callProcedure();

	ArrayList<MainCalProject> callProcedureForMain1();

	ArrayList<MainCalProject> callProcedureForMain2();
	

}
