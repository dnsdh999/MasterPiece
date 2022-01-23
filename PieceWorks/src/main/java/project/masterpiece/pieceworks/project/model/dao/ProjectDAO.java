package project.masterpiece.pieceworks.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
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

	public Project selectProject(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("projectMapper.selectProject", projectNo);
	}

	public Calendar selectCalendar(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("projectMapper.selectCalendar", projectNo);
	}

	public ArrayList<Project> getPListForMain(SqlSessionTemplate sqlSession, Project p) {
		return (ArrayList)sqlSession.selectList("projectMapper.getPListForMain", p);
	}


}
