package com.kh.springFinal.service;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class GmailService implements EmailService{

	@Autowired
	private JavaMailSender sender;



	@Override
	public void sendMessage2(MimeMessage message2) {
		sender.send(message2);
	}

	@Override
	public void sendMessage2(String email, String title) throws MessagingException, IOException {
		MimeMessage message2 = sender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message2, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject(title);
		ClassPathResource resource = new ClassPathResource("mail-template.html");
		String text = FileUtils.readFileToString(resource.getFile(), "UTF-8");
		helper.setText(text, true);
	
		
		sender.send(message2);
		
	}
	
	
	
}
