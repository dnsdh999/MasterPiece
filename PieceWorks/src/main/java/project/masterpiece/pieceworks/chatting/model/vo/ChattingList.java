package project.masterpiece.pieceworks.chatting.model.vo;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class ChattingList {
	private int chatNo;
	private String chatStatus;
	private String chatTitle;
	private String chatCreator;
	private int projectNo;
	private Date createDate;
	private String chatMessage;
	private int unreadCount;
	private Time sendTime;
	private Date sendDate;
	private ArrayList<JoinMember> joinMember;
	
	public ChattingList() {
		// TODO Auto-generated constructor stub
	}

	
	
	



	

	public ChattingList(int chatNo, String chatStatus, String chatTitle, String chatCreator, int projectNo,
			Date createDate, String chatMessage, int unreadCount, Time sendTime, Date sendDate,
			ArrayList<JoinMember> joinMember) {
		super();
		this.chatNo = chatNo;
		this.chatStatus = chatStatus;
		this.chatTitle = chatTitle;
		this.chatCreator = chatCreator;
		this.projectNo = projectNo;
		this.createDate = createDate;
		this.chatMessage = chatMessage;
		this.unreadCount = unreadCount;
		this.sendTime = sendTime;
		this.sendDate = sendDate;
		this.joinMember = joinMember;
	}









	public Date getSendDate() {
		return sendDate;
	}








	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}








	public int getChatNo() {
		return chatNo;
	}



	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}


	public String getChatStatus() {
		return chatStatus;
	}



	public void setChatStatus(String chatStatus) {
		this.chatStatus = chatStatus;
	}



	public String getChatTitle() {
		return chatTitle;
	}



	public void setChatTitle(String chatTitle) {
		this.chatTitle = chatTitle;
	}


	public String getChatCreator() {
		return chatCreator;
	}



	public void setChatCreator(String chatCreator) {
		this.chatCreator = chatCreator;
	}



	public int getProjectNo() {
		return projectNo;
	}




	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}



	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getChatMessage() {
		return chatMessage;
	}



	public void setChatMessage(String chatMessage) {
		this.chatMessage = chatMessage;
	}



	public Time getSendTime() {
		return sendTime;
	}


	public void setSendTime(Time sendTime) {
		this.sendTime = sendTime;
	}


	public ArrayList<JoinMember> getJoinMember() {
		return joinMember;
	}



	public void setJoinMember(ArrayList<JoinMember> joinMember) {
		this.joinMember = joinMember;
	}


	





	public int getUnreadCount() {
		return unreadCount;
	}









	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}









	@Override
	public String toString() {
		return "ChattingList [chatNo=" + chatNo + ", chatStatus=" + chatStatus + ", chatTitle=" + chatTitle
				+ ", chatCreator=" + chatCreator + ", projectNo=" + projectNo + ", createDate=" + createDate
				+ ", chatMessage=" + chatMessage + ", unreadCount=" + unreadCount + ", sendTime=" + sendTime
				+ ", sendDate=" + sendDate + ", joinMember=" + joinMember + "]";
	}








	

	
	
}
