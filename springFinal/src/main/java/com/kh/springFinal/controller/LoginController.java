package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.AdminDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.StudentDao;




@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private AdminDao adminDao;
	
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
			session.removeAttribute("admininfo");
			return "redirect:member/main";
		}
		else {
			return "redirect:/?error";
		}
		
	}
	
	@PostMapping("/admin_login")
	public String admin_login(@ModelAttribute AdminDto adminDto, HttpSession session) {
		AdminDto admin = adminDao.admin_login(adminDto);
		if(admin != null) {
			session.setAttribute("admininfo", admin);
			session.removeAttribute("userinfo");
			return "redirect:member/main";
		}
		else {
			return "redirect:/?error";
		}
	}
	
}
