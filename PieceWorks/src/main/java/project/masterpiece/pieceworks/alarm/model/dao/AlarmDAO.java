package project.masterpiece.pieceworks.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.alarm.model.vo.Alarm;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Repository("aDAO")
public class AlarmDAO {

	public int getAllAlarmCount(SqlSessionTemplate sqlSession, String userEmail) {
		return sqlSession.selectOne("alarmMapper.getAllAlarmCount", userEmail);
	}

	public ArrayList<Alarm> getAllAlarmList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("alarmMapper.getAllAlarmList", email);
	}

	public ArrayList<Alarm> getAlarmListForPage(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("alarmMapper.getAlarmListForPage", email);
	}

	public int updateAlarmStatus(SqlSessionTemplate sqlSession, int aNo) {
		return sqlSession.update("alarmMapper.updateAlarmStatus", aNo);
	}

	public int insertAlarm(SqlSessionTemplate sqlSession, Alarm a) {
		return sqlSession.insert("alarmMapper.insertAlarm", a);
	}

	public int getProjectAlarmCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("alarmMapper.getProjectAlarmCount", m);
	}

	public ArrayList<Alarm> getProjectAlarmList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("alarmMapper.getProjectAlarmList", m);
	}

	public ArrayList<Alarm> getPAListForPage(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("alarmMapper.getPAListForPage", m);
	}

}
