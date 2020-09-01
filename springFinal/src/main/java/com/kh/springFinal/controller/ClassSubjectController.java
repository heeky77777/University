package com.kh.springFinal.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.repository.ClassSubjectDao;

@Controller
@RequestMapping("/class_subject")
public class ClassSubjectController {
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	
	@GetMapping("regist")
	public String regist(Model model) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("year", year);	
		
		return "class_subject/regist";
	}
	
	@PostMapping("regist")
	public String regist(@ModelAttribute ClassSubjectDto classSubjectDto) {
		
		classSubjectDao.subjectRegist(classSubjectDto);
		
		return "redirect:regist";
	}

}
