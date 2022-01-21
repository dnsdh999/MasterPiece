package project.masterpiece.pieceworks.alarm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.alarm.model.dao.AlarmDAO;
import project.masterpiece.pieceworks.alarm.model.vo.Alarm;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Service("aService")
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmDAO aDAO;
		
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAllAlarmCount(String userEmail) {
		return aDAO.getAllAlarmCount(sqlSession,userEmail);
	}

	@Override
	public ArrayList<Alarm> getAllAlarmList(String email) {
		return aDAO.getAllAlarmList(sqlSession, email);
	}

	@Override
	public ArrayList<Alarm> getAlarmListForPage(String email) {
		return aDAO.getAlarmListForPage(sqlSession, email);
	}

	@Override
	public int updateAlarmStatus(int aNo) {
		return aDAO.updateAlarmStatus(sqlSession, aNo);
	}

	@Override
	public int insertAlarm(Alarm a) {
		return aDAO.insertAlarm(sqlSession, a);
	}

	@Override
	public int getProjectAlarmCount(Member m) {
		return aDAO.getProjectAlarmCount(sqlSession, m);
	}

	@Override
	public ArrayList<Alarm> getProjectAlarmList(Member m) {
		return aDAO.getProjectAlarmList(sqlSession, m);
	}

	@Override
	public ArrayList<Alarm> getPAListForPage(Member m) {
		return aDAO.getPAListForPage(sqlSession, m);
	}

	@Override
	public int updateAllAlarmStatus(Member m) {
		return aDAO.updateAllAlarmStatus(sqlSession, m);
	}
}
