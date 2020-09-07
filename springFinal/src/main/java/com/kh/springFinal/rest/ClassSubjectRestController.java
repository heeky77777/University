package com.kh.springFinal.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.service.ClassSubjectService;

@RestController
@RequestMapping("class_subject")
public class ClassSubjectRestController {

	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	@Autowired
	private ClassSubjectService classSubjectService;
	
	// 학기 시작, 종료일
	@GetMapping("semesterDate")
	public SemesterDto semsterDate(
											@RequestParam String this_year,
											@RequestParam String semester_type) {
		
		return classSubjectDao.getSemester(this_year, semester_type);
	}
	
	// 강의실 중복 검사
	@GetMapping("check")
	public ClassSubjectDto check(
										@ModelAttribute ClassSubjectDto classSubjectDto,
										@RequestParam String this_year,
										@RequestParam String semester_type) {
		
		return classSubjectService.getConfirm(classSubjectDto, this_year, semester_type);
	}
	
	@GetMapping("lecture_list")
	public List<ClassSubjectDto> list(){
		List<ClassSubjectDto> list = classSubjectDao.getList(); 
		return list;
	}
	
}
