package com.kh.springFinal.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.repository.ClassSubjectDao;

@RestController
@RequestMapping("class_subject")
public class ClassSubjectRestController {

	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	
	@GetMapping("check")
	public ClassSubjectDto check(@ModelAttribute ClassSubjectDto classSubjectDto) {
		
		return classSubjectDao.getConfirm(classSubjectDto);
	}
	
	@GetMapping("lecture_list")
	public List<ClassSubjectDto> list(){
		List<ClassSubjectDto> list = classSubjectDao.getList(); 
		return list;
	}
	
}
