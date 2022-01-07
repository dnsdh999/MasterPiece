package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import project.masterpiece.pieceworks.chatting.model.dao.ChattingDAO;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

@Service("cService")
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDAO cDAO;
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	


	@Override
	public ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c) {
		return cDAO.selectChattingMessageList(sqlSession,c);
	}

	@Override
	public ArrayList<ChattingList> selectChattingList(String email) {
		return cDAO.selectChattingList(sqlSession, email);
	}


	@Override
	public int insertChatting(ChattingMessage chatMessage) {
		return cDAO.insertChatting(sqlSession,chatMessage);
	}

	@Override
	public int insertChatRoom(ChattingInvite ci) {
		return cDAO.insertChatRoom(sqlSession,ci);
	}

	@Override
	public int insertChatJoin(ArrayList<String> eList) {
		return cDAO.insertChatJoin(sqlSession,eList);
	}

	@Override
	public int insertFirstMeg(HashMap<String, String> map) {
		return cDAO.insertFirstMeg(sqlSession, map);
	}

	@Override
	public int updateChatTitle(ChattingList cl) {
		return cDAO.updateChatTitle(sqlSession, cl);
	}

	

}
