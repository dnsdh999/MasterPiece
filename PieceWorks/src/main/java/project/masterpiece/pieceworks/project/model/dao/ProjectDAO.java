package project.masterpiece.pieceworks.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.project.model.vo.MainCalProject;
import project.masterpiece.pieceworks.project.model.vo.Project;

@Repository("pDAO")
public class ProjectDAO {

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}

	public ArrayList<Project> getPList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("projectMapper.getPList", email);
	}

	public int insertPrJoin(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertPrJoin", p);
	}

	public ArrayList<Project> selectProject(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProject", projectNo);
	}

	public ArrayList<Calendar> selectCalendar(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectCalendar", pNo);
	}

	public ArrayList<Project> getPListForMain(SqlSessionTemplate sqlSession, Project p) {
		return (ArrayList)sqlSession.selectList("projectMapper.getPListForMain", p);
	}

	public ArrayList<MainCalProject> getPListForMain2(SqlSessionTemplate sqlSession, MainCalProject mp) {
		return (ArrayList)sqlSession.selectList("projectMapper.getPListForMain2", mp);
	}


}
