package com.kh.professor.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.kh.professor.entity.ProfessorDto;

@Controller
public class ProfessorController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/regist")
	public String regist() {
		return "/professor/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute ProfessorDto professorDto) {
		sqlSession.insert("professor.regist",professorDto);
		return "redirect:regist_result";
	}
	
	@GetMapping("/regist_result")
	public String regist_result() {
		return "/professor/regist_result";
	}
}
