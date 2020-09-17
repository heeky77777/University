package com.kh.springFinal.websocket;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.tools.DocumentationTool.Location;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketGroupServer extends TextWebSocketHandler{
	/**
	 * 사용자를 기억하기 위한 저장소
	 * - 중복 불가
	 * - 동기화 지원
	 */
	private List<WebSocketSession> users = new CopyOnWriteArrayList<>();
	private List<WebSocketSession> wait_users = new CopyOnWriteArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
//		log.info("사용자 접속! 현재{}명",users.size());
		
		if(session.getUri().toString().endsWith("/go")) {
			
			if(users.size() < 2) {
				users.add(session);
				log.info("사용자 접속! 현재{}명",users.size());
				System.out.println(session.getUri());		
			}
			
			else{
				String result = "waitting";
				TextMessage join_person = new TextMessage(result);
				session.sendMessage(join_person);
			}
		}
		
		else {
			log.info("정원초과");
			
			wait_users.add(session);
			
			String result = String.valueOf(wait_users.size());
			TextMessage wait_person = new TextMessage(result);
			session.sendMessage(wait_person);
			
			log.info("대기! 현재{}명",wait_users.size());
			
					
			System.out.println(session.getUri());
		}
			
		log.info("apply 현재{}명",users.size());
		log.info("id 현재{}",session.getId());
		
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
//		users.remove(session);
		if(session.getUri().toString().endsWith("/go")) {
			users.remove(session);
		}
		
		if(users.size() < 2) {
			
			String result = "apply";
			TextMessage join_person = new TextMessage(result);
			session.sendMessage(join_person);
			wait_users.remove(session);
		}
		
//			log.info("사용자 접속! 현재{}명",users.size());
//			System.out.println(session.getUri());
			
				
//			wait_users.remove(session);
			log.info("대기! 현재{}명",wait_users.size());	
			log.info("사용자 접속! 현재{}명",users.size());

			
		}
//		else {
//			if(users.size() <2) {
//				wait_users.remove(session);
//				String result = "apply";
//				TextMessage join_person = new TextMessage(result);
//				session.sendMessage(join_person);
//			}
//		}
	}
	
	

