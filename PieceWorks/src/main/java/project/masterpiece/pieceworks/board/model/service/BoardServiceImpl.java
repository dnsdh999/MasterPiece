package project.masterpiece.pieceworks.board.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project.masterpiece.pieceworks.board.model.dao.BoardDAO;
import project.masterpiece.pieceworks.board.model.vo.Board;
//import project.masterpiece.pieceworks.board.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.board.model.vo.Reply;
import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	//개수 확인
	@Override
	public int getListCount(int projectNo) {
		return bDAO.getListCount(sqlSession, projectNo);
	}

	//리스트
	@Override
	public ArrayList<Board> selectList(PageInfo pi, int projectNo) {
		
		return bDAO.selectList(sqlSession, pi, projectNo);
	}

	@Override
	public Board selectBoard(int boardNo) {		
		//조회수 
		int result = bDAO.addReadCount(sqlSession, boardNo);
		
		Board b = null;		
		if(result > 0 ) {
			b = bDAO.selectBoard(sqlSession, boardNo);	
		} 
		return b;
	}

	
	@Override
	public int deleteBoard(int boardNo) {
		return bDAO.deleteBoard(sqlSession, boardNo);
	}
	
	
	@Override
	public int updateBoard(Board b) {		
		return bDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> getReplyList(int boardNo) {
		return bDAO.getReplyList(sqlSession, boardNo);
	}

//	@Override
//	public int insertBoard(Board b, List<MultipartFile> fileList) {	
//		return bDAO.insertBoard(sqlSession, b, fileList);	
//	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertFile(List<FileBox> fBox) {
		
		return bDAO.insertFile(sqlSession, fBox);
	}

	@Override
	public ArrayList<FileBox> selectFileBox(int boardNo) {
		
		return bDAO.selectFileBox(sqlSession, boardNo);
	}

	@Override
	public int deleteFile(int[] deleteNo) {
		return bDAO.deleteFile(sqlSession, deleteNo);
	}

	
	@Override
	public int updateFile(List<FileBox> fBox) {
		return bDAO.updateFile(sqlSession, fBox);
	}

	@Override
	public ArrayList<Member> selectReplyWriter(String[] emailArr) {
		return bDAO.selectReplyWriter(sqlSession, emailArr);
	}




	

}
