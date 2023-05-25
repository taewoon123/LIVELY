package com.lively.chat.server;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.lively.chat.vo.ChatVo;

@Component
public class ChatServer extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	//연결됨
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + "연결 됨");
		users.put(session.getId(), session);
	}
	
	
	//연결끊김
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + "연결 종료됨");
		users.remove(session.getId());
	}
	
	//메세지 수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log(session.getId() + message.getPayload());
		for(WebSocketSession s : users.values()) {
			s.sendMessage(message);
			log(s.getId() + message.getPayload());
		}
		
	}
	
	
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
}
