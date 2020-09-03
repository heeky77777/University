package com.kh.springFinal.controller;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.service.ProfessorService;

@Controller
@RequestMapping("/professor")
public class ProfessorController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ProfessorService professorService;

	@GetMapping("/regist")
	public String regist() {
		return "professor/regist";
	}

	@PostMapping("/regist")
	public String regist(@ModelAttribute ProfessorDto professorDto, @ModelAttribute ProfessorFileDto professorFileDto,
			@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		sqlSession.insert("professor.regist", professorDto);
		professorService.add(professorFileDto, file);
		return "redirect:/professor";
	}

}
