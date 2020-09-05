package com.kh.springFinal.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

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
	
	
	// 강의 등록
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
		
		// 강의 등록
		int class_sub_no = classSubjectDao.subjectRegist(classSubjectDto);
		
		if(class_sub_no == 0) {
			return "redirect:regist";
		}
		
		// 강의 계획서 업로드
		classSubjectService.addFile(classSubjectFileDto, file, class_sub_no);
		
		return "redirect:list";
		
	}
	
//	@GetMapping("list")
//	public String list(
//						@RequestParam(required = false) int profe_no,
//						Model model) {
//		
//		List<ClassSubjectDto> list = classSubjectDao.profList(profe_no);
//		model.addAttribute("list", list);
//		
//		return "lecture/list";
//	}

	// 
	@GetMapping("list")
	public String list(
					@RequestParam(required = false) String year,
					@RequestParam(required = false) int semesterSearch,
					@RequestParam(required = false) String typeSearch,
					@RequestParam(required = false) String majorSearch,
					@RequestParam(required = false) String classSubSearch,
			Model model) {
		
		List<ClassSubjectDto> list = classSubjectDao.getList(); 
		model.addAttribute("list", list);
		
		return "class_subject/list";
	}
}








