package project.masterpiece.pieceworks.alarm.config;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import project.masterpiece.pieceworks.alarm.model.AlarmException;
import project.masterpiece.pieceworks.alarm.model.service.AlarmService;
import project.masterpiece.pieceworks.alarm.model.vo.Alarm;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Controller
public class WebSocketHandler extends TextWebSocketHandler implements InitializingBean {
	private static HashMap<String, WebSocketSession> hashSessions = new HashMap<String, WebSocketSession>();
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	
	@Autowired
	private AlarmService aService;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String email = getEmail(session);
		
		hashSessions.put(email, session);

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		
		Alarm a = objectMapper.readValue(msg, Alarm.class);
		
		String[] recipientArr = a.getRecipient().split(",");
		List<String> recipientList = Arrays.asList(recipientArr);
		
        String email = getEmail(session);
		
		int result = 0;
		for(String s : recipientList) {
            if(!s.equals(email)) {
                a.setRecipient(s);
    			result += aService.insertAlarm(a);
            }
		}
		
		result = result + 1;
		System.out.println("알림받는사람들 크기 : " + recipientList.size());
		System.out.println("리져트 크기 : " + result);
		//로그인해서 세션에 들어와있는 사람들과 받은 recipient를 비교해서

		if(recipientList.size() == result) {
			hashSessions.forEach((key, value)->{
				if(recipientList.contains(key)) {
					try {
						value.sendMessage(message);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			});
		}else {
			throw new AlarmException("실패하였습니다.");
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String email = getEmail(session);
		hashSessions.remove(email);
	}

	public String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member m = (Member)httpSession.get("loginUser");
		String email = m.getEmail();
		return email;
	}
	
	public int getCurrentPno(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member m = (Member)httpSession.get("loginUser");
		int currPno = m.getCurrPno();
		return currPno;
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {}
}
