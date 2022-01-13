package project.masterpiece.pieceworks.member.model.service;

import project.masterpiece.pieceworks.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member memberLogin(Member m);

	/*
	 * int duplicateEmail(String email);
	 */ 
	int updateMember(Member m);

	int deleteMember(String email);
	
	Member searchEmail(Member m);

	Member searchPwd(Member m);

	int updatePwd(Member m);





}
