package project.masterpiece.pieceworks.member.model.vo;

import java.sql.Date;

public class Member {
	private String email;
	private String pwd;
	private String name;
	private String nickName;
	private String phone;
	private Date enroll_date;
	private String m_status;
	private String originProfile;	// 프로필 원본 파일
	private String reProfile;		// 등록된 프로필 파일
	
	public Member() {}

	public Member(String email, String pwd, String name, String nickName, String phone, Date enroll_date,
			String m_status, String originProfile, String reProfile) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.enroll_date = enroll_date;
		this.m_status = m_status;
		this.originProfile = originProfile;
		this.reProfile = reProfile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getOriginProfile() {
		return originProfile;
	}

	public void setOriginProfile(String originProfile) {
		this.originProfile = originProfile;
	}

	public String getReProfile() {
		return reProfile;
	}

	public void setReProfile(String reProfile) {
		this.reProfile = reProfile;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", phone="
				+ phone + ", enroll_date=" + enroll_date + ", m_status=" + m_status + ", originProfile=" + originProfile
				+ ", reProfile=" + reProfile + "]";
	}
}
