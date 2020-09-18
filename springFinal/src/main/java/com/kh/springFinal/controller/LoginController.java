package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.AdminDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.ProfessorDao;
import com.kh.springFinal.repository.StudentDao;




@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ProfessorDao professorDao;
	
	@GetMapping("/")
	public String login(HttpSession session) {
		session.removeAttribute("userinfo");
		session.removeAttribute("admininfo");
		session.removeAttribute("profeinfo");
		return "login";
	}
	
	@PostMapping("/student_login")
	public String login(@ModelAttribute StudentDto studentDto,
						HttpSession session) {
		StudentDto student = studentDao.login(studentDto);
		
		if(student != null) {
			session.setAttribute("userinfo", student);
			session.removeAttribute("admininfo");
			session.removeAttribute("profeinfo");
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
//			session.setAttribute("userinfo", admin);
			session.removeAttribute("studentinfo");
			session.removeAttribute("profeinfo");
			
			return "redirect:member/main";
		}
		else {
			return "redirect:/?error";
		}
	}
	
	@PostMapping("/profe_login")
	public String profe_login(@ModelAttribute ProfessorDto professorDto, HttpSession session) {
		ProfessorDto professor = professorDao.profe_login(professorDto);
		if(professor != null) {
			session.setAttribute("profeinfo", professor);
//			session.setAttribute("userinfo", professor);
			session.removeAttribute("studentinfo");
			session.removeAttribute("admininfo");
			
			return "redirect:member/main";
		}
		else {
			return "redirect:/?error";
		}
	}
}
