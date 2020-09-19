package com.kh.springFinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.springFinal.entity.SMCDto;
import com.kh.springFinal.repository.ClassScoreDao;

import oracle.security.o3logon.a;

@Controller
@RequestMapping("/score")
public class ClassScoreController {

	@Autowired
	private ClassScoreDao classScoreDao;
	
	
	
	@GetMapping("/insert/{class_sub_no}")
	public String List(@PathVariable int class_sub_no,
					   @ModelAttribute SMCDto SMCDto,
						Model model, 
						RedirectAttributes attr) {
		 
		List<SMCDto> StudentList = classScoreDao.StudentList(class_sub_no);
		model.addAttribute("StudentList", StudentList);	
		
		attr.addAttribute("class_sub_no",class_sub_no);
		return "score/insert";
	}

	
	 @PostMapping("/insert")
	 public String StudentList( int class_sub_no, SMCDto smcDto) {
	 
		List<SMCDto> list = classScoreDao.StudentList(class_sub_no);
		
	
	
		 
		return "score/edit";
	 }
	}
	
	

