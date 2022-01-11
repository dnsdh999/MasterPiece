package project.masterpiece.pieceworks.calendar.model.vo;

public class Calendar {
	private int calendarNo;
	private String cCreator;
	private String nickName;
	private String cStartDate;
	private String cEndDate;
	private String modifyDate;
	private String category;
	private String calStatus;
	private String calTitle;
	private String calContent;
	private String bgColor;
	private String allDay;
	private String projectNo;
	
	public Calendar() {}

	public Calendar(int calendarNo, String cCreator, String nickName, String cStartDate, String cEndDate,
			String modifyDate, String category, String calStatus, String calTitle, String calContent, String bgColor,
			String allDay, String projectNo) {
		super();
		this.calendarNo = calendarNo;
		this.cCreator = cCreator;
		this.nickName = nickName;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.calStatus = calStatus;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.bgColor = bgColor;
		this.allDay = allDay;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCalStatus() {
		return calStatus;
	}

	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "Calendar [calendarNo=" + calendarNo + ", cCreator=" + cCreator + ", nickName=" + nickName
				+ ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", modifyDate=" + modifyDate + ", category="
				+ category + ", calStatus=" + calStatus + ", calTitle=" + calTitle + ", calContent=" + calContent
				+ ", bgColor=" + bgColor + ", allDay=" + allDay + ", projectNo=" + projectNo + "]";
	}

}
