package project.masterpiece.pieceworks.chatting.model.vo;

public class ChattingAddMember {
	private String nickname;
	private String chatMember;
	public ChattingAddMember() {
		super();
	}
	public ChattingAddMember(String nickname, String chatMember) {
		super();
		this.nickname = nickname;
		this.chatMember = chatMember;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getChatMember() {
		return chatMember;
	}
	public void setChatMember(String chatMember) {
		this.chatMember = chatMember;
	}
	@Override
	public String toString() {
		return "ChattingAddMember [nickname=" + nickname + ", chatMember=" + chatMember + "]";
	}
	
}
