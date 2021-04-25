//package com.haeyo.web.board.impl;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnError;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.RemoteEndpoint.Basic;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//
//@Controller
//@ServerEndpoint(value="/echo.do")
//public class HaeyoChat {
//	private static final List<Session> sessionList = new ArrayList<Session>();
//	private static final Logger logger = LoggerFactory.getLogger(HaeyoChat.class);
//
//	public HaeyoChat() {
//		System.out.println("웹소켓 서버 객체 생성");
//	}
//	@OnOpen
//	private void onOpen(Session session) {
//		logger.info("Open session id:"+session.getId());
//		
//		try {
//			final Basic basic = session.getBasicRemote();
//			basic.sendText("대화방이 열렸습니다");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//		sessionList.add(session);
//	}
//	
//	private void sendAllSessionToMessage(Session self, String sender, String message) {
//		
//		try {
//			for(Session session : HaeyoChat.sessionList) {
//				if(!self.getId().contentEquals(session.getId())) {
//			session.getBasicRemote().sendText(sender+" : "+message);
//				}
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//	}
//	
//	@OnMessage
//	public void onMessage(String message, Session session) {
//		String sender = message.split(",")[1];
//		message = message.split(",")[0];
//		
//		logger.info("Message From "+sender+": "+message);
//		try {
//			final Basic basic = session.getBasicRemote();
//			basic.sendText("<나>: "+message);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//		sendAllSessionToMessage(session, sender, message);
//	}
//	
//	@OnError
//	public void onError(Throwable e ,Session session) {
//		
//	}
//	
//	@OnClose
//	public void onClose(Session session) {
//		logger.info("Session "+session.getId()+"has ended");
//		sessionList.remove(session);
//	}
//}
