package project.masterpiece.pieceworks.calendar.model.service;

import java.util.List;
import java.util.Map;
import java.sql.Date;
import java.util.ArrayList;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertEvent(Calendar c);

	List<Calendar> getEventList();

	List<Map<String, Object>> getEvents();

	int addEvent(Calendar c);

	ArrayList<Calendar> getEventList(Calendar c);

	int editEvent(int cNo);

}
