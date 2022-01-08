package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

public interface ChattingService {



	ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c);

	ArrayList<ChattingList> selectChattingList(String email);

	int insertChatting(ChattingMessage chatMessage);

	int insertChatRoom(ChattingInvite ci);

	int insertChatJoin(ArrayList<String> eList);

	int insertFirstMeg(HashMap<String, String> map);

	int updateChatTitle(ChattingList cl);

	int chatRoomOut(ChattingMessage cm);

	int insertOutMeg(ChattingMessage cm);

	int joinMemberCount(int chatNo);

	int deleteRoom(int chatNo);

	int deleteChatJoinMem(int chatNo);
}
