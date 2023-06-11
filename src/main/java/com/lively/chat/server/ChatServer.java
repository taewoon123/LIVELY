package com.lively.chat.server;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.lively.chat.vo.ChatVo;
import com.lively.friend.vo.FriendVo;
import com.lively.member.vo.MemberVo;

@Component
public class ChatServer extends TextWebSocketHandler {
	
	//모든 세션의 정보를 담을 객체 (여러 명의 client)
		private final Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();  
		
		private final SqlSessionTemplate sst;
		
		@Autowired
		public ChatServer(SqlSessionTemplate sst) {
			this.sst = sst;
		}

		//연결됨
			@Override
			public void afterConnectionEstablished(WebSocketSession session) throws Exception {
				System.out.println("연결됨");
				sessionSet.add(session);
			}

			//메세지 수신함
			@Override
			protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
				System.out.println("메세지 수신");
				String msg = message.getPayload();
				System.out.println("msg : " + msg);
				
				MemberVo memberLog = (MemberVo) session.getAttributes().get("memberLog");
				
				String no = (String) session.getAttributes().get("friendNo");
				
				FriendVo friendVo = sst.selectOne("friend-reply.getInfo", no);
				
			    String sender = memberLog.getName();  //보내는 사람(로그인 한 사람)
			    String friendNo = friendVo.getFriendNo();
			   String sendTime = friendVo.getEnrollDate();
			   
			   System.out.println(sender);
				
				ChatVo friendchatVo = new ChatVo();
				friendchatVo.setMsgContent(msg);
				friendchatVo.setSender(sender); 
				friendchatVo.setRoomNo(friendNo);
				friendchatVo.setMsgTime(sendTime);
				
				Gson gson = new Gson();
				String jsonStr = gson.toJson(friendchatVo);  //messageVo를 json 형태로 만들어준다
				TextMessage textMsg = new TextMessage(jsonStr);
//				session.sendMessage(textMsg); //messageVo를 json 문자열로 바꾸고 TextMessage로써 보내야된다
				
				broadCast(textMsg);
			}

			private void broadCast(TextMessage textMsg) throws IOException {
				for(WebSocketSession session : sessionSet) {  //sessionSet에 있는걸 하나하나 다 꺼내서 session에 담는다
					session.sendMessage(textMsg);
				}
			}

			//연결 끊김
			@Override
			public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
				System.out.println("연결 끊김");
				sessionSet.remove(session);
			}
			
	
}
