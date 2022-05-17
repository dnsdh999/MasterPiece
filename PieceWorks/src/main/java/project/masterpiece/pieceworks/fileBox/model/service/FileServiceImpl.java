package project.masterpiece.pieceworks.fileBox.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.fileBox.dao.FileDAO;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;


@Service("fService")
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<FileBox> selectFile(int projectNo) {
		return fDAO.selectFile(sqlSession, projectNo);
	}

	

}
