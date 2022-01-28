package project.masterpiece.pieceworks.common;

public class FileBox {
	private int fileNo;
	private String filePath;
	private long fileSize;
	private String fOriginName;
	private String fChangeName;
	private String fUploadDate;
	private String fStatus;
	private int boardNo;
	
	public FileBox() {}

	public FileBox(int fileNo, String filePath, long fileSize, String fOriginName, String fChangeName,
			String fUploadDate, String fStatus, int boardNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fOriginName = fOriginName;
		this.fChangeName = fChangeName;
		this.fUploadDate = fUploadDate;
		this.fStatus = fStatus;
		this.boardNo = boardNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getfOriginName() {
		return fOriginName;
	}

	public void setfOriginName(String fOriginName) {
		this.fOriginName = fOriginName;
	}

	public String getfChangeName() {
		return fChangeName;
	}

	public void setfChangeName(String fChangeName) {
		this.fChangeName = fChangeName;
	}

	public String getfUploadDate() {
		return fUploadDate;
	}

	public void setfUploadDate(String fUploadDate) {
		this.fUploadDate = fUploadDate;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "FileBox [fileNo=" + fileNo + ", filePath=" + filePath + ", fileSize=" + fileSize + ", fOriginName="
				+ fOriginName + ", fChangeName=" + fChangeName + ", fUploadDate=" + fUploadDate + ", fStatus=" + fStatus
				+ ", boardNo=" + boardNo + "]";
	}

	
}
