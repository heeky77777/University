package com.kh.springFinal.rest;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.service.ClassSubjectService;

@RestController
@RequestMapping("classSubject")
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
	@GetMapping("roomCheck")
	public ClassSubjectDto roomCheck(
								@ModelAttribute ClassSubjectDto classSubjectDto,
								@RequestParam String this_year,
								@RequestParam String semester_type) {
		
		return classSubjectService.getConfirm(classSubjectDto, this_year, semester_type);
	}
	
	
	
	// 파일 다운로드
	@GetMapping("planDown")
	public ResponseEntity<ByteArrayResource> planDown(@RequestParam int class_sub_no) throws IOException{
		return classSubjectService.getDown(class_sub_no);
	}
	
	// 파일 삭제
	@GetMapping("deleteFile")
	public void deleteFile(@ModelAttribute ClassSubjectFileDto classSubjectFileDto) {
		classSubjectDao.deleteFile(classSubjectFileDto);
		
	}
	
	// 강의 시간 검사
	@GetMapping("classTimeCheck")
	public ClassSubjectDto classTimeCheck(@RequestParam int class_sub_no) {
		return classSubjectDao.getSub(class_sub_no);
	}
	
	
	// 교수 강의 중복 검자(등록시 해당요일에 같은 시간에 등록 되어 있는지)
	@GetMapping("getCheckSubTime")
	public ClassSubjectDto getCheckSubTime(
			@ModelAttribute ClassSubjectDto classSubjectDto,
			@RequestParam String this_year,
			@RequestParam String semester_type) {
		return classSubjectDao.getSubCheck(classSubjectDto, this_year, semester_type);
	}
	
	
	// 교수 학과 조회
	@GetMapping("profeCheck")
	public ProfessorDto profeCheck(@ModelAttribute ProfessorDto professorDto) {
		return classSubjectDao.getProfeMajor(professorDto);
	}
	
	@GetMapping("mySub")
	public List<ClassSubjectDto> mySub(@RequestParam int profe_no) {
		return classSubjectDao.getList(profe_no);
	}

	
}
