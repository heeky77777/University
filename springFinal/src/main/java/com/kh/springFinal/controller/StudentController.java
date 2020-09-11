package com.kh.springFinal.controller;


import java.io.File;
import java.io.IOException;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.StudentFileuploadDto;
import com.kh.springFinal.repository.StudentDao;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/student_join")
	public String join() {
		return "student/student_join";
	}
	@PostMapping("/student_join")
	public String join(@ModelAttribute StudentDto studentDto) {
		StudentDto student = sqlSession.selectOne("student.numb", studentDto);
		
		if(student==null) {
			sqlSession.insert("student.signup", studentDto);
			return "redirect:student_join";
			
		}
		else {
			return "redirect:student_join?error";
		}		
	}
	
	@GetMapping("/student_info")
	public String info() {
		
		return "student/student_info";
	}
	
//	@PostMapping("/student_join")
//	public String regist(
//						@ModelAttribute ClassSubjectDto classSubjectDto,
//						@ModelAttribute StudentFileuploadDto studentfileuploadDto,
//						@RequestParam MultipartFile file) throws IllegalStateException, IOException {
//		
//		int class_sub_no = StudentDao.subjectRegist(classSubjectDto);
//		
//		classSubjectService.addFile(classSubjectFileDto, file, class_sub_no);
//		
//		
//		return "redirect:regist";
//	}
	
}	

