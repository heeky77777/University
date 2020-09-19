package com.kh.springFinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.springFinal.entity.SMCDto;
import com.kh.springFinal.repository.ClassScoreDao;

@Controller
@RequestMapping("/score")
public class ClassScoreController {

	@Autowired
	private ClassScoreDao classScoreDao;
	
	
	
	@GetMapping("/list")
	public String List(@RequestParam int class_sub_no,
					   @ModelAttribute SMCDto SMCDto,
						Model model, 
						RedirectAttributes attr) {
		 
		List<SMCDto> StudentList = classScoreDao.StudentList(class_sub_no);
		model.addAttribute("StudentList", StudentList);	
		
		attr.addAttribute("class_sub_no",class_sub_no);
		return "score/insert";
	}

	
	 @GetMapping("/insert")
	 public String StudentList(@RequestParam int class_sub_no,
			 					SMCDto smcDto,
			 					Model model) {
	 
		List<SMCDto> StudentList = classScoreDao.StudentList(class_sub_no);
		model.addAttribute("StudentList", StudentList);
	
		return "score/insert";
	 }
	 
	 @PostMapping("/insert")
	 public String StudentList(@RequestParam int class_sub_no) {
		
		 
		 
		 return "socre/insert";
		 
	 }

	 
}
	
	

