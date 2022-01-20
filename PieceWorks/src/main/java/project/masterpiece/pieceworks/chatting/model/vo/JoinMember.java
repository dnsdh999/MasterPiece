package project.masterpiece.pieceworks.chatting.model.vo;

public class JoinMember {
	private String chatMember;
	private String memberName;
	private String reProfile;
	
	public JoinMember() {
		// TODO Auto-generated constructor stub
	}

	
	public JoinMember(String chatMember, String memberName, String reProfile) {
		super();
		this.chatMember = chatMember;
		this.memberName = memberName;
		this.reProfile = reProfile;
	}


	public String getReProfile() {
		return reProfile;
	}


	public void setReProfile(String reProfile) {
		this.reProfile = reProfile;
	}


	public String getChatMember() {
		return chatMember;
	}

	public void setChatMember(String chatMember) {
		this.chatMember = chatMember;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	@Override
	public String toString() {
		return "JoinMember [chatMember=" + chatMember + ", memberName=" + memberName + ", reProfile=" + reProfile + "]";
	}

	
}
