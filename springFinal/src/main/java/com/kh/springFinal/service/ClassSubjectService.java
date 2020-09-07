package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;

public interface ClassSubjectService {


	// 강의장 중복 검사 
	ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto, String this_year, String semester_type);
	
	// 강의 등록
	int subjectRegist(ClassSubjectDto classSubjectDto, String this_year, String semester_type);

	// 강의 계획서 업로드
	void addFile(ClassSubjectFileDto classSubjectFileDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException;
	

}
