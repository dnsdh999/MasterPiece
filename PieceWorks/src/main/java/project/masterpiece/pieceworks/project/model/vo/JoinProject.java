package project.masterpiece.pieceworks.project.model.vo;

public class JoinProject {
	private int projectNo;
	private String pMember;
	
	public JoinProject() {}

	public JoinProject(int projectNo, String pMember) {
		super();
		this.projectNo = projectNo;
		this.pMember = pMember;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getpMember() {
		return pMember;
	}

	public void setpMember(String pMember) {
		this.pMember = pMember;
	}

	@Override
	public String toString() {
		return "ProjectJoin [projectNo=" + projectNo + ", pMember=" + pMember + "]";
	}
	
	
}
