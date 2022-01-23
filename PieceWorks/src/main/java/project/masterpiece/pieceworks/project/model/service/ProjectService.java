package project.masterpiece.pieceworks.project.model.service;

import java.util.ArrayList;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project p);

	ArrayList<Project> getPList(String email);

	int insertPrJoin(Project p);

	ArrayList<Project> selectProject(int projectNo);

	ArrayList<Calendar> selectCalendar(int pNo);


}
