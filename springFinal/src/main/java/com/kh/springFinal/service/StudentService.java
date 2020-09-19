package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.StudentFileDto;

public interface StudentService {
	
	public void fileupload(StudentFileDto studentFileDto, MultipartFile file, int student_no) throws IllegalStateException, IOException;
	
	ResponseEntity<ByteArrayResource> getFile(int student_file_no) throws IOException;

}
