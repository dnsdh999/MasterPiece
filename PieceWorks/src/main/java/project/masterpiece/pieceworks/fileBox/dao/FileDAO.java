package project.masterpiece.pieceworks.fileBox.dao;

import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("fDAO")
public class FileDAO {

	
	public ArrayList<FileBox> selectFile(SqlSessionTemplate sqlSession, int projectNo) {
			
		return (ArrayList)sqlSession.selectList("boardMapper.selectFile", projectNo);
	}
	


}
