package com.lively.chat.server;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.lively.chat.vo.ChatVo;

@Component
public class ChatServer extends TextWebSocketHandler {
	
	//연결됨
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨");
	}

	//연결끊김
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결끊김");
	}
	
	//메세지 수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		ChatVo vo = new ChatVo();
		
		
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		
		session.sendMessage(new TextMessage(str));
		
	}
	
	
	
}
