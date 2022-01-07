package project.masterpiece.pieceworks.chatting.model.vo;

import java.util.ArrayList;

public class ChattingInvite {
	private String userEmail;
	private String roomName;
	private int projectNo;
	
	public ChattingInvite() {
		// TODO Auto-generated constructor stub
	}

	

	public ChattingInvite(String userEmail, String roomName, int projectNo) {
		super();
		this.userEmail = userEmail;
		this.roomName = roomName;
		this.projectNo = projectNo;

	}



	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}



	@Override
	public String toString() {
		return "ChattingInvite [userEmail=" + userEmail + ", roomName=" + roomName + ", projectNo=" + projectNo + "]";
	}



	
}
