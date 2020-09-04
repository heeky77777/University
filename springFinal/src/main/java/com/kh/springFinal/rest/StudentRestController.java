package com.kh.springFinal.rest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.StudentDto;

@RestController
@RequestMapping("/student")
public class StudentRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/student_numb")
	public StudentDto join(@RequestParam int student_numb) {
		StudentDto studentDto = sqlSession.selectOne("student.numb", student_numb);
		
		return studentDto;
	}
	
	

}
