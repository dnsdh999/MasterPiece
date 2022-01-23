package project.masterpiece.pieceworks.chatting.model.vo;



public class ChattingMessage {
	private int chatMessageNo;
	private String chatMessage;
	private String sendTime;
	private String nickName;
	private int chatNo;
	private String chatWriter;
	private String reprofile;
	public ChattingMessage() {
		super();
	}
	
	
	
	public ChattingMessage(int chatMessageNo, String chatMessage, String sendTime, String nickName, int chatNo,
			String chatWriter , String reprofile ) {
		super();
		this.chatMessageNo = chatMessageNo;
		this.chatMessage = chatMessage;
		this.sendTime = sendTime;
		this.nickName = nickName;
		this.chatNo = chatNo;
		this.chatWriter = chatWriter;
		 this.reprofile = reprofile; 
	}



	public int getChatMessageNo() {
		return chatMessageNo;
	}
	public void setChatMessageNo(int chatMessageNo) {
		this.chatMessageNo = chatMessageNo;
	}
	public String getChatMessage() {
		return chatMessage;
	}
	public void setChatMessage(String chatMessage) {
		this.chatMessage = chatMessage;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	
	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatWriter() {
		return chatWriter;
	}
	public void setChatWriter(String chatWriter) {
		this.chatWriter = chatWriter;
	}



	public String getReprofile() {
		return reprofile;
	}



	public void setReprofile(String reprofile) {
		this.reprofile = reprofile;
	}



	@Override
	public String toString() {
		return "ChattingMessage [chatMessageNo=" + chatMessageNo + ", chatMessage=" + chatMessage + ", sendTime="
				+ sendTime + ", nickName=" + nickName + ", chatNo=" + chatNo + ", chatWriter=" + chatWriter
				+ ", reprofile=" + reprofile + "]";
	}


	
	  
	



	
	
	
}
