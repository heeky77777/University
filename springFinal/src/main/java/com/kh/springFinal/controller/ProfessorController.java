package com.kh.springFinal.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.entity.SemesterDto;
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
	public String regist(@ModelAttribute ProfessorDto professorDto){
		//등록하기전에 중복확인
		int exist=professorDao.isExist();
		
		if(exist>0) {
			//다시뽑아라
		}else {
			professorDao.regist(professorDto);
		}
		
		return "redirect:regist"; //수정해야해
	}	
	
	//교수 디테일 페이지
	@GetMapping("/detail")
	public String detail(@RequestParam int profe_no, Model model
			) throws IllegalStateException, IOException {
		
	
		
		/*
		 * int profe_no = professorDao.regist(professorDto); //return받은 profe_no
		 * professorService.add(professorFileDto, file, profe_no);
		 */
		
		
		//교수 넘버 단일조회로 dto보내기
		ProfessorDto professorDto=professorDao.get(profe_no);
		model.addAttribute("professorDto",professorDto);
		//학과명 받아오기
		MajorDto majorDto = professorDao.getMajor(profe_no);
		String major_type = majorDto.getMajor_type();
		model.addAttribute("major_type", major_type);//학과명 보내기
		
		//학기명 받아오기(체크)
		SemesterDto semesterDto = professorDao.getSem(profe_no);
		String semester_type = semesterDto.getSemester_type();
		model.addAttribute("semester_type",semester_type);//학기명 보내기
		
		
		return "professor/detail";
		
	}
	
	@PostMapping("/detail")
	public String detail(@ModelAttribute ProfessorFileDto professorFileDto,
			@ModelAttribute ProfessorUploadVO professorUploadVO,
			@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		
		professorService.add(professorFileDto, file, 0);
		
		
		return "professor/detail";
	}
	
	//정보 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int profe_no, @ModelAttribute ProfessorDto professorDto) {
		
		ProfessorDto professorDto2 = professorDao.get(profe_no);
		model.addAttribute("professorDto", professorDto2);
		
		//학기명 받아오기(체크)
		SemesterDto semesterDto = professorDao.getSem(profe_no);
		String semester_type = semesterDto.getSemester_type();
		model.addAttribute("semester_type",semester_type);//학기명 보내기

	
		return "professor/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute ProfessorDto professorDto, @RequestParam int profe_no) {
		ProfessorDto professorEdit = professorDao.get(profe_no);
		return "redirect:detail"; //detail로 redirect
	}
	
	
}
