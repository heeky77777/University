package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.StudentFileDto;

public interface StudentService {
	
	void student_file_add(StudentFileDto studentFileDto, MultipartFile file, int student_no) throws IllegalStateException, IOException;

}
