package project.masterpiece.pieceworks.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.dao.ProjectDAO;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;
import project.masterpiece.pieceworks.project.model.vo.JoinProject;
import project.masterpiece.pieceworks.project.model.vo.Project;

@Service("pService")
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertProject(Project p) {
		return pDAO.insertProject(sqlSession, p);
	}

	@Override
	public ArrayList<Project> getPList(String email) {
		return pDAO.getPList(sqlSession, email);
	}

	@Override
	public int insertPrJoin(Project p) {
		return pDAO.insertPrJoin(sqlSession, p);
	}

	@Override
	public ArrayList<Project> selectProject(int projectNo) {
		return pDAO.selectProject(sqlSession, projectNo);
	}

	@Override
	public ArrayList<Calendar> selectCalendar(int pNo) {
		return pDAO.selectCalendar(sqlSession, pNo);
	}

	@Override
	public ArrayList<Project> getPListForMain(Project p) {
		return pDAO.getPListForMain(sqlSession, p);
	}

	@Override
	public ArrayList<MainCalProject> getPListForMain2(MainCalProject mp) {
		return pDAO.getPListForMain2(sqlSession, mp);
	}
	
	@Override
	public ArrayList<Member> MemberProjectList(int projectNo) {
		return pDAO.memberProjectList(sqlSession,projectNo);
	}

	@Override
	public ArrayList<Member> notMemberProjectlist(int projectNo) {
		return pDAO.notMemberProjectList(sqlSession,projectNo);
	}

	@Override
	public ArrayList<Member> emailSearch(HashMap<String, Object> map) {
		return pDAO.emailSearch(sqlSession,map);
	}

	@Override
	public int addProjectMember(ArrayList<JoinProject> list1) {
		return pDAO.addProjectMember(sqlSession,list1);
	}

}