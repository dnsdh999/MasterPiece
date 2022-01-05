package project.masterpiece.pieceworks.calendar.model.vo;

public class Calendar {
	private int calendarNo;
	private String cCreator;
	private String cStartDate;
	private String cEndDate;
	private String cModifyDate;
	private String cCategory;
	private String cStatus;
	private String cTitle;
	private String cContent;
	private String cBgColor;
	private String cAllday;
	private int projectNo;
	
	public Calendar() {}

	public Calendar(int calendarNo, String cCreator, String cStartDate, String cEndDate, String cModifyDate,
			String cCategory, String cStatus, String cTitle, String cContent, String cBgColor, String cAllday,
			int projectNo) {
		super();
		this.calendarNo = calendarNo;
		this.cCreator = cCreator;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cModifyDate = cModifyDate;
		this.cCategory = cCategory;
		this.cStatus = cStatus;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cBgColor = cBgColor;
		this.cAllday = cAllday;
		this.projectNo = projectNo;
	}

	public int getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}

	public String getcCreator() {
		return cCreator;
	}

	public void setcCreator(String cCreator) {
		this.cCreator = cCreator;
	}

	public String getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(String cStartDate) {
		this.cStartDate = cStartDate;
	}

	public String getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcModifyDate() {
		return cModifyDate;
	}

	public void setcModifyDate(String cModifyDate) {
		this.cModifyDate = cModifyDate;
	}

	public String getcCategory() {
		return cCategory;
	}

	public void setcCategory(String cCategory) {
		this.cCategory = cCategory;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcBgColor() {
		return cBgColor;
	}

	public void setcBgColor(String cBgColor) {
		this.cBgColor = cBgColor;
	}

	public String getcAllday() {
		return cAllday;
	}

	public void setcAllday(String cAllday) {
		this.cAllday = cAllday;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "Calendar [calendarNo=" + calendarNo + ", cCreator=" + cCreator + ", cStartDate=" + cStartDate
				+ ", cEndDate=" + cEndDate + ", cModifyDate=" + cModifyDate + ", cCategory=" + cCategory + ", cStatus="
				+ cStatus + ", cTitle=" + cTitle + ", cContent=" + cContent + ", cBgColor=" + cBgColor + ", cAllday="
				+ cAllday + ", projectNo=" + projectNo + "]";
	}

	
}
