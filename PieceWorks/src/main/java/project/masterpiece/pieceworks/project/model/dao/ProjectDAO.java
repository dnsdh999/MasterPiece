package project.masterpiece.pieceworks.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.calendar.model.vo.Calendar;
import project.masterpiece.pieceworks.member.model.vo.Member;
import project.masterpiece.pieceworks.project.model.vo.JoinProject;
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

	public ArrayList<Member> memberProjectList(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.memberProjectList",projectNo);
	}

	public ArrayList<Member> notMemberProjectList(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.notMemberProjectList",projectNo);
	}

	public ArrayList<Member> emailSearch(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("projectMapper.emailSearch",map);
	}

	public int addProjectMember(SqlSessionTemplate sqlSession, ArrayList<JoinProject> list1) {
		return sqlSession.insert("projectMapper.addProjectMember",list1);
	}
}
