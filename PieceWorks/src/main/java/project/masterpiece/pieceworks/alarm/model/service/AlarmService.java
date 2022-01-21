package project.masterpiece.pieceworks.alarm.model.service;

import java.util.ArrayList;

import project.masterpiece.pieceworks.alarm.model.vo.Alarm;
import project.masterpiece.pieceworks.member.model.vo.Member;

public interface AlarmService {

	int getAllAlarmCount(String userEmail);

	ArrayList<Alarm> getAllAlarmList(String email);

	ArrayList<Alarm> getAlarmListForPage(String email);

	int updateAlarmStatus(int aNo);

	int insertAlarm(Alarm a);

	int getProjectAlarmCount(Member m);

	ArrayList<Alarm> getProjectAlarmList(Member m);

	ArrayList<Alarm> getPAListForPage(Member m);

}
