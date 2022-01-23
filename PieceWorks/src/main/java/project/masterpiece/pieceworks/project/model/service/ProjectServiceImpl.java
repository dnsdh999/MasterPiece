package project.masterpiece.pieceworks.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.dao.ProjectDAO;
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

}
