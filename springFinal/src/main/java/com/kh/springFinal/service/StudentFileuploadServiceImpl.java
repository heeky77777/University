package com.kh.springFinal.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.StudentFileuploadDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.repository.StudentDao;

public class StudentFileuploadServiceImpl {
	
	@Autowired
	private StudentDao studentDao;

//	@Override
//	public void addFileupload(StudentFileuploadDto studentFileuploadDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException {
//		
//		studentFileuploadDto.setStudent_file_no(class_sub_no);
//		studentFileuploadDto.setStudent_file_name(file.getOriginalFilename());
//		studentFileuploadDto.setStudent_file_type(file.getContentType());
//		studentFileuploadDto.setStudent_file_size(file.getSize());
//		
//		int sub_file_no = classSubjectDao.addFileupload(studentFileuploadDto);
//		
//		File taget = new File("D:/upload/student", String.valueOf(sub_file_no));
//		file.transferTo(taget);
//		
//		
//	}

}
