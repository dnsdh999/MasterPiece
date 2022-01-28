package project.masterpiece.pieceworks.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String boardWriter;
	private String nickName;
	private int projectNo;
	private String bStatus;
	private int boardCount;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, Date boardDate, String boardWriter,
			String nickName, int projectNo, String bStatus, int boardCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardWriter = boardWriter;
		this.nickName = nickName;
		this.projectNo = projectNo;
		this.bStatus = bStatus;
		this.boardCount = boardCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardWriter=" + boardWriter + ", nickName=" + nickName
				+ ", projectNo=" + projectNo + ", bStatus=" + bStatus + ", boardCount=" + boardCount + "]";
	}

	
}
