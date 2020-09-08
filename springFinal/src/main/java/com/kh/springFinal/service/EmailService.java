package com.kh.springFinal.service;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;

public interface EmailService {

	
	void sendMessage2(MimeMessage message2);
	
	void sendMessage2(String email, String title) throws MessagingException, IOException;
	
}
