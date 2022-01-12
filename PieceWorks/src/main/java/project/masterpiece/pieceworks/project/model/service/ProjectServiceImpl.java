package project.masterpiece.pieceworks.project.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
