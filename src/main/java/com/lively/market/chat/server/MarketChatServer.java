package com.lively.market.chat.server;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.lively.market.chat.vo.MarketChatVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.vo.MemberVo;

@Component
public class MarketChatServer extends TextWebSocketHandler {
	
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MarketChatServer(SqlSessionTemplate sst) {
		this.sst = sst;
	}

	//연결됨
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("연결됨");
		}

		//메세지 수신함
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.println("메세지 수신");
			String msg = message.getPayload();
			System.out.println("msg : " + msg);
			
			MemberVo memberLog = (MemberVo) session.getAttributes().get("memberLog");
//			MarketVo marketVo = (MarketVo) session.getAttributes().get("marketVo");
			
			MarketVo marketVo = sst.selectOne("market-reply.getInfo");
			
		    String sender = memberLog.getName();  //보내는 사람(로그인 한 사람)
		    String marketNo = marketVo.getMarketNo();
		   String sendTime = marketVo.getEnrollDate();
			
			MarketChatVo chatVo = new MarketChatVo();
			chatVo.setMsgContent(msg);
		    chatVo.setSender(sender); 
		    chatVo.setRoomNo(marketNo);
			chatVo.setMsgTime(sendTime);
			
//			chatVo.setSender(marketVo.getWriterName());
//			chatVo.setRoomNo(marketVo.getMarketNo());
				
			Gson gson = new Gson();
			String jsonStr = gson.toJson(chatVo);  //messageVo를 json 형태로 만들어준다
////			Object tmepObj = gson.fromJson(str, );
//			System.out.println(chatVo);
//			System.out.println(str);
			session.sendMessage(new TextMessage(jsonStr)); //messageVo를 json 문자열로 바꾸고 TextMessage로써 보내야된다
		}

		//연결 끊김
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("연결 끊김");
		}
		
}
