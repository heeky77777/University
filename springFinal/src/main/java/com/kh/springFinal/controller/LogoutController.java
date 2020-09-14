package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LogoutController {

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		session.removeAttribute("admininfo");
		session.removeAttribute("profeinfo");
		return "redirect:/";
	}
}
