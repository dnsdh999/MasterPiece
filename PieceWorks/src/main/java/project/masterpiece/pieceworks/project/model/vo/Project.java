package project.masterpiece.pieceworks.project.model.vo;

import java.sql.Date;

public class Project {
	private int projectNo;
	private String pTitle;
	private String pCreater;
	private String pNickName;
	private String pContent;
	private String pStatus;
	private Date pStartDate;
	private Date pEndDate;
	private Date createDate;
	
	public Project() {}

	public Project(int projectNo, String pTitle, String pCreater, String pNickName, String pContent, String pStatus,
			Date pStartDate, Date pEndDate, Date createDate) {
		super();
		this.projectNo = projectNo;
		this.pTitle = pTitle;
		this.pCreater = pCreater;
		this.pNickName = pNickName;
		this.pContent = pContent;
		this.pStatus = pStatus;
		this.pStartDate = pStartDate;
		this.pEndDate = pEndDate;
		this.createDate = createDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpCreater() {
		return pCreater;
	}

	public void setpCreater(String pCreater) {
		this.pCreater = pCreater;
	}

	public String getpNickName() {
		return pNickName;
	}

	public void setpNickName(String pNickName) {
		this.pNickName = pNickName;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public Date getpStartDate() {
		return pStartDate;
	}

	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}

	public Date getpEndDate() {
		return pEndDate;
	}

	public void setpEndDate(Date pEndDate) {
		this.pEndDate = pEndDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", pTitle=" + pTitle + ", pCreater=" + pCreater + ", pNickName="
				+ pNickName + ", pContent=" + pContent + ", pStatus=" + pStatus + ", pStartDate=" + pStartDate
				+ ", pEndDate=" + pEndDate + ", createDate=" + createDate + "]";
	}

}
