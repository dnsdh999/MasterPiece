package project.masterpiece.pieceworks.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.alarm.model.vo.Alarm;

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

}
