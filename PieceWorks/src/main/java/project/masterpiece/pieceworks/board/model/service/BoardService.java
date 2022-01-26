package project.masterpiece.pieceworks.board.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import project.masterpiece.pieceworks.board.model.vo.Board;
//import project.masterpiece.pieceworks.board.model.vo.PageInfo;
import project.masterpiece.pieceworks.project.model.vo.PageInfo;
import project.masterpiece.pieceworks.board.model.vo.Reply;
import project.masterpiece.pieceworks.common.FileBox;
import project.masterpiece.pieceworks.member.model.vo.Member;

public interface BoardService {

	int getListCount(int projectNo);//개수

	ArrayList<Board> selectList(PageInfo pi, int projectNo);

	Board selectBoard(int boardNo);

	int updateBoard(Board b);

	int deleteBoard(int boardNo);

	int insertReply(Reply r);

	ArrayList<Reply> getReplyList(int boardNo);

	int insertBoard(Board b);

	int insertFile(List<FileBox> fBox); 

	ArrayList<FileBox> selectFileBox(int boardNo);

	int deleteFile(int[] deleteNo);

	int updateFile(List<FileBox> fBox);

	ArrayList<Member> selectReplyWriter(String[] emailArr);


}
