package project.masterpiece.pieceworks.chatting.model.vo;


public class ChattingCheckRoom {
	private String userUuid;
	private String chatNo;
	
	public String getUserUuid() {
		return userUuid;
	}

	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}

	public String getChatNo() {
		return chatNo;
	}

	public void setChatNo(String chatNo) {
		this.chatNo = chatNo;
	}

	public ChattingCheckRoom(String userUuid, String chatNo) {
		super();
		this.userUuid = userUuid;
		this.chatNo = chatNo;
	}

	public ChattingCheckRoom() {
		super();
	}

	@Override
	public String toString() {
		return "ChattingCheckRoom [userUuid=" + userUuid + ", chatNo=" + chatNo + "]";
	}
	
}
