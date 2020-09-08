package com.kh.springFinal.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.repository.ProfessorDao;
import com.kh.springFinal.service.ProfessorService;
import com.kh.springFinal.vo.ProfessorUploadVO;



@Controller
@RequestMapping("/professor")
public class ProfessorController {


	@Autowired
	private ProfessorDao professorDao;

	@Autowired
	private ProfessorService professorService;

	//정보 등록
	@GetMapping("/regist")
	public String regist() {
		return "professor/regist";
	}

	@PostMapping("/regist")
	public String regist(@ModelAttribute ProfessorDto professorDto, 
						@ModelAttribute ProfessorFileDto professorFileDto,
						@ModelAttribute ProfessorUploadVO professorUploadVO, 
						@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		int profe_no = professorDao.regist(professorDto); //return받은 profe_no
		professorService.add(professorFileDto, file, profe_no);
		return "professor/regist";
	}
	
	
	//정보 수정
	@GetMapping("/edit")
	public String edit() {
		return "professor/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute ProfessorDto professorDto, @RequestParam int profe_no) {
		ProfessorDto editInfo = professorDao.get(profe_no);
		return "professor/edit"; //detail로 redirect
	}
}
