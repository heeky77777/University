package com.kh.springFinal.controller;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.entity.StudentDto;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/student_join")
	public String join() {
		return "student/student_join";
	}
	@PostMapping("/student_join")
	public String join(@ModelAttribute StudentDto studentDto) {
		StudentDto student = sqlSession.selectOne("student.numb", studentDto);
		
		if(student==null) {
			sqlSession.insert("student.signup", studentDto);
			return "redirect:student_join";
			
		}
		else {
			return "redirect:student_join?error";
		}
		
		
	}
}	
	

