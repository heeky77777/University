package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectFileDto;

public interface ClassSubjectService {

	void addFile(ClassSubjectFileDto classSubjectFileDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException;
	

}
