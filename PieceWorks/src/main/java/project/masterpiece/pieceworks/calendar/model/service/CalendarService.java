package project.masterpiece.pieceworks.calendar.model.service;

import java.util.List;
import java.util.Map;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertEvent(Calendar c);

	List<Calendar> getEventList();

	List<Map<String, Object>> getEvents();


}
