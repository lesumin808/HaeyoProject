package com.haeyo.biz.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.haeyo.biz.user.UserVO;


@Component
public class HandlerChat extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(HandlerChat.class);
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		
	//1대 1
	HashMap<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>(); //웹소켓 세션을 담아둘 맵
	
	//서버에 접속이 성공했을 때
	//@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(),session);
		logger.info("afterConnectionEstablished : " + session.getId());
	}
	
	
	//소켓에 메세지를 보냈을때receiverEmail);
	//이곳에서 => onmessage
	//이곳에서 type지정
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = JsonToObjectParser(msg);
		System.out.println("obj" + obj);
		if(obj.get("type").equals("alarm")) {
			for(String key : sessionMap.keySet()) {
				WebSocketSession wss = sessionMap.get(key);
				try {
					wss.sendMessage(new TextMessage(obj.toJSONString()));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}

	//json파일이 들어오면 파싱해주는 함수
	//Json 형태의 문자열을 파라미터로 받아서 Simple JSONObject로 파싱 처리 
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	//웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("user");
			if(loginUser == null) {
				return session.getId();
			} else {
				return loginUser.getuEmail();
			}
	}
	
}