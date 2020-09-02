package com.kh.springFinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.StudentDto;

@Controller
@RequestMapping("/")
public class LoginController {

	@GetMapping("/")
	public String login() {
		return "login";
	}
	
//	@PostMapping("/")
//	public String login(@ModelAttribute StudentDto studentDto) {
		
//	}
}
