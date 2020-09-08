package com.kh.springFinal.rest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.repository.ProfessorDao;

@RestController
@RequestMapping("/rest_professor")
public class ProfessorRestController {

	@Autowired
	private ProfessorDao professorDao;


	// 교수 아이디 조회
	@GetMapping("/check_id")
	public ProfessorDto getId(@RequestParam String profe_id) {

	 ProfessorDto professorDto=professorDao.getId(profe_id);
		return professorDto;
	}
}
