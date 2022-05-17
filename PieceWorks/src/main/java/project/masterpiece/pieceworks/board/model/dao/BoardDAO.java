package project.masterpiece.pieceworks.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import project.masterpiece.pieceworks.board.model.vo.Board;
//import project.masterpiece.pieceworks.board.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.board.model.vo.Reply;
import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int projectNo) {
		
		return sqlSession.selectOne("boardMapper.getListCount", projectNo);
	}

	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int projectNo) {
		
		//offset몇개 건너뛸지
		int offset = (pi.getCurrentPage() - 1) * pi.getboardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getboardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", projectNo, rowBounds);
	}


	//조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.addReadCount", boardNo);
	}


	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}


	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}


	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}


	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}


	public ArrayList<Reply> getReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.getReplyList", boardNo);
	}


//	public int insertBoard(SqlSessionTemplate sqlSession, Board b, List<MultipartFile> fileList) {
//		//for문 돌려서 파일vo안에 넣기
//		for(int i = 0; i < fileList.size(); i++) {		
//		}
//		return 0;
//	}


	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}


	public int insertFile(SqlSessionTemplate sqlSession, List<FileBox> fBox) {
		
		int result = 0;
		for (int i = 0; i < fBox.size(); i++) {
			
			FileBox f = fBox.get(i);//하나 가져오기			
			result += sqlSession.insert("boardMapper.insertFile", f);	
		}
			
		return result; 
	}


	public ArrayList<FileBox> selectFileBox(SqlSessionTemplate sqlSession, int boardNo) {
			
		return (ArrayList)sqlSession.selectList("boardMapper.selectFileBox", boardNo);
	}


	public int deleteFile(SqlSessionTemplate sqlSession, int[] deleteNo) {
		return sqlSession.delete("boardMapper.deleteFile", deleteNo);
	}


	public int updateFile(SqlSessionTemplate sqlSession, List<FileBox> fBox) {
		
		int result = 0;
		for (int i = 0; i < fBox.size(); i++) { //파일이 여러개 추가된경우
			
			FileBox f = fBox.get(i); 		
			result += sqlSession.insert("boardMapper.updateFile", f);	
		}
			
		return result; 
	}

	public ArrayList<Member> selectReplyWriter(SqlSessionTemplate sqlSession, String[] emailArr) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectReplyWriter", emailArr);
	}


}
