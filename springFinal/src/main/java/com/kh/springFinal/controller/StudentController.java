package com.kh.springFinal.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	      sqlSession.insert("student.signup", studentDto);
	      
	      return "redirect:student_join";
	      
	   }

}
