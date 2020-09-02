package com.kh.springFinal.controller;

import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.service.ClassSubjectService;

@Controller
@RequestMapping("/class_subject")
public class ClassSubjectController {
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	@Autowired
	private ClassSubjectService classSubjectService;
	
	
	@GetMapping("regist")
	public String regist(Model model) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("year", year);	
		
		return "class_subject/regist";
	}
	
	@PostMapping("regist")
	public String regist(
						@ModelAttribute ClassSubjectDto classSubjectDto,
						@ModelAttribute ClassSubjectFileDto classSubjectFileDto,
						@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		
		int class_sub_no = classSubjectDao.subjectRegist(classSubjectDto);
		
		classSubjectService.addFile(classSubjectFileDto, file, class_sub_no);
		
		
		return "redirect:regist";
	}

}
