package com.lively.market.chat.server;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.lively.market.chat.vo.MarketChatVo;
import com.lively.market.vo.MarketVo;

@Component
public class MarketChatServer extends TextWebSocketHandler {

	//연결됨
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("연결됨");
		}

		//메세지 수신함
		protected void handleTextMessage(WebSocketSession session, TextMessage message, MarketVo marketVo) throws Exception {
			System.out.println("메세지 수신");
			System.out.println(message);
			
			MarketChatVo chatVo = new MarketChatVo();
			chatVo.setMsgContent(message);
		/*
		 * chatVo.setSender(marketVo.getWriterName());
		 * chatVo.setRoomNo(marketVo.getMarketNo());
		 */
//			vo.setMessage("안녕하세여");
//			vo.setName("김스프링");
//			vo.setTime("점심시간");
			
			Gson gson = new Gson();
			String str = gson.toJson(chatVo);  //messageVo를 json 형태로 만들어준다
//			Object tmepObj = gson.fromJson(str, );
			session.sendMessage(new TextMessage(str)); //messageVo를 json 문자열로 바꾸고 TextMessage로써 보내야된다
		}

		//연결 끊김
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("연결 끊김");
		}
		
}
