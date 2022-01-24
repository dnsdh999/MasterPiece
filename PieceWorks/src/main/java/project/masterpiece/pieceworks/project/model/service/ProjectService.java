package project.masterpiece.pieceworks.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.vo.JoinProject;
import project.masterpiece.pieceworks.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project p);

	ArrayList<Project> getPList(String email);

	int insertPrJoin(Project p);

	ArrayList<Project> selectProject(int projectNo);

	ArrayList<Calendar> selectCalendar(int pNo);

	ArrayList<Project> getPListForMain(Project p);

	ArrayList<MainCalProject> getPListForMain2(MainCalProject mp);

	ArrayList<Member> MemberProjectList(int projectNo);

	ArrayList<Member> notMemberProjectlist(int projectNo);

	ArrayList<Member> emailSearch(HashMap<String, Object> map);

	int addProjectMember(ArrayList<JoinProject> list1);

}
