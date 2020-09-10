package com.kh.springFinal.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.service.EmailService;

@Controller
@RequestMapping("/email")
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	@GetMapping("/send")
	public String send() {
		
		return "email/send";
	}
	@PostMapping("/send")
	public String send(@RequestParam String email, @RequestParam String title) throws IOException, MessagingException {
		
		emailService.sendMessage2(email, title);
		return "redirect:send";
		
	}
}
