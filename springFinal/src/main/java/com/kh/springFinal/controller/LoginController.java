package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.StudentDao;




@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private StudentDao studentDao;
	
	@GetMapping("/")
	public String login() {
		return "login";
	}
	
	@PostMapping("/student_login")
	public String login(@ModelAttribute StudentDto studentDto,
						HttpSession session) {
		StudentDto student = studentDao.login(studentDto);
		
		if(student != null) {
			session.setAttribute("userinfo", student);
			return "redirect:member/main";
		}
		else {
			return "redirect:login?error";
		}
		
	}
	
}
