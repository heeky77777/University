package com.kh.springFinal.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.ProfessorDto;

@Controller
@RequestMapping("/professor")
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
		return "redirect:/professor/regist_result";
	}
	
		@GetMapping("/regist_result")
		public String regist_result() {
		return "/professor/regist_result";
	}
}
