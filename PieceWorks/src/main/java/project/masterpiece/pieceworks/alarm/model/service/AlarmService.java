package project.masterpiece.pieceworks.alarm.model.service;

import java.util.ArrayList;

import project.masterpiece.pieceworks.alarm.model.vo.Alarm;

public interface AlarmService {

	int getAllAlarmCount(String userEmail);

	ArrayList<Alarm> getAllAlarmList(String email);

	ArrayList<Alarm> getAlarmListForPage(String email);

	int updateAlarmStatus(int aNo);

}
