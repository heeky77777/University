package com.kh.springFinal.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ClassSubjectDto check() {
		return classSubjectDao.getConfirm();
	}
	
}
