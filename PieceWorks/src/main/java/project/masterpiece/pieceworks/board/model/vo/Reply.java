package project.masterpiece.pieceworks.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyCont;
	private String replyWriter;
	private String nickName;
	private int boardNo;
	private Date replyDate;
	private String reStatus;
	
	public Reply() {}

	public Reply(int replyNo, String replyCont, String replyWriter, String nickName, int boardNo, Date replyDate,
			String reStatus) {
		super();
		this.replyNo = replyNo;
		this.replyCont = replyCont;
		this.replyWriter = replyWriter;
		this.nickName = nickName;
		this.boardNo = boardNo;
		this.replyDate = replyDate;
		this.reStatus = reStatus;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyCont() {
		return replyCont;
	}

	public void setReplyCont(String replyCont) {
		this.replyCont = replyCont;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyCont=" + replyCont + ", replyWriter=" + replyWriter + ", nickName="
				+ nickName + ", boardNo=" + boardNo + ", replyDate=" + replyDate + ", reStatus=" + reStatus + "]";
	}
	
}
