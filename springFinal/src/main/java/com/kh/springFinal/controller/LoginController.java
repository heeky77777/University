package com.kh.springFinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
}
