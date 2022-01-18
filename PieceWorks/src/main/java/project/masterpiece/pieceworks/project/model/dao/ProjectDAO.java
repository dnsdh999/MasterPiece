package project.masterpiece.pieceworks.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.Project;

@Repository("pDAO")
public class ProjectDAO {

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.getListCount");
	}

	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getboardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getboardLimit());
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectList", null, rowBounds);
	}

	public ArrayList<Project> getPList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("projectMapper.getPList", email);
	}

	public int insertPrJoin(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertPrJoin", p);
	}

}
