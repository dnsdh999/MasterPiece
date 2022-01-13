package project.masterpiece.pieceworks.alarm.model.vo;

import java.sql.Date;

public class Alarm {
	private int alarmNo;
	private int alarmType;
	private String alarmContent;
	private String alarmStatus;
	private String recipient;
	private int projectNo;
	private Date alarmDate;
	
	public Alarm() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Alarm(int alarmNo, int alarmType, String alarmContent, String alarmStatus, String recipient, int projectNo,
			Date alarmDate) {
		super();
		this.alarmNo = alarmNo;
		this.alarmType = alarmType;
		this.alarmContent = alarmContent;
		this.alarmStatus = alarmStatus;
		this.recipient = recipient;
		this.projectNo = projectNo;
		this.alarmDate = alarmDate;
	}



	public Date getAlarmDate() {
		return alarmDate;
	}



	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}



	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public int getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(int alarmType) {
		this.alarmType = alarmType;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public String getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}



	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmType=" + alarmType + ", alarmContent=" + alarmContent
				+ ", alarmStatus=" + alarmStatus + ", recipient=" + recipient + ", projectNo=" + projectNo
				+ ", alarmDate=" + alarmDate + "]";
	}

	
	
	
}
