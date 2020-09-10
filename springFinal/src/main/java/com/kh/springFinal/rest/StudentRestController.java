package com.kh.springFinal.rest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.StudentDao;

@RestController
@RequestMapping("/student")
public class StudentRestController {
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/student_numb")
	public StudentDto join(@RequestParam int student_numb) {
		StudentDto studentDto = sqlSession.selectOne("student.numb", student_numb);
		
		return studentDto;
	}
	
	@GetMapping("/find_pw")
	public StudentDto find_pw(@ModelAttribute StudentDto studentDto) {
		
		StudentDto student = studentDao.find_pw(studentDto);
		
		return student;
	}
	
	@GetMapping("/find_id")
	public StudentDto find_id(@ModelAttribute StudentDto studentDto) {
		
		StudentDto student = studentDao.find_id(studentDto);
		
		return student;
	}

}
