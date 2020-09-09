package com.kh.springFinal.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.repository.MajorDao;
import com.kh.springFinal.service.ClassSubjectService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/class_subject")
@Slf4j
public class ClassSubjectController {
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	@Autowired
	private ClassSubjectService classSubjectService;
	
	@Autowired
	private MajorDao majorDao;
	
	
	// 강의 등록
	@GetMapping("regist")
	public String regist(Model model) {
		
		// 현재 년도
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("year", year);
		
		
		
		return "class_subject/regist";
	}

	@PostMapping("regist")
	public String regist(
						@ModelAttribute ClassSubjectDto classSubjectDto,
						@ModelAttribute ClassSubjectFileDto classSubjectFileDto,
						@RequestParam String this_year,
						@RequestParam String semester_type,
						@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		
		int class_sub_no = classSubjectService.subjectRegist(classSubjectDto, this_year, semester_type);
		
		// 강의 등록
		
		if(class_sub_no == 0) {
			return "redirect:regist";
		}
		
		// 강의 계획서 업로드
		if(classSubjectFileDto.isFile()) {
			classSubjectService.addFile(classSubjectFileDto, file, class_sub_no);
		}
		return "redirect:list";
		
	}
	

	// 강의 목록
	@GetMapping("list")
	public String list(Model model) {
		
		List<MajorDto> majorList = majorDao.major_list();
		List<ClassSubjectDto> list = classSubjectDao.getList(); 
		model.addAttribute("majorList", majorList);
		model.addAttribute("list", list);
		
		return "class_subject/list";
	}
	
	// 강의 검색
	@PostMapping("list")
	public String searchList(
			@RequestParam String yearSearch,
			@RequestParam int semesterSearch,
			@RequestParam String typeSearch,
			@RequestParam String majorSearch,
			@RequestParam String classSubSearch) {
		
		
		
		return "redirect:list";
	}
	
	// 강의 삭제
	@GetMapping("delete/{class_sub_no}")
	public String delete(@PathVariable int class_sub_no) {
		
		classSubjectDao.delete(class_sub_no);
		
		return "redirect:/class_subject/list";
	}
}








