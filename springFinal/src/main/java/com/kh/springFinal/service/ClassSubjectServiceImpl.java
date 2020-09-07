package com.kh.springFinal.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.ClassSubjectDao;

@Service
public class ClassSubjectServiceImpl implements ClassSubjectService{
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	

	// 강의장 중복 검사
	@Override
	public ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto, String this_year, String semester_type) {
		
		SemesterDto semesterDto = classSubjectDao.getSemester(this_year, semester_type);
		classSubjectDto.setSemester_no(semesterDto.getSemester_no());
		
		return classSubjectDao.getConfirm(classSubjectDto);
		
	}	
	
	// 강의 등록
	@Override
	public int subjectRegist(ClassSubjectDto classSubjectDto, String this_year, String semester_type) {
		
		SemesterDto semesterDto = classSubjectDao.getSemester(this_year, semester_type);
		classSubjectDto.setSemester_no(semesterDto.getSemester_no());
		
		int class_sub_no = classSubjectDao.subjectRegist(classSubjectDto);
		
		return class_sub_no;
	}
	
	
	// 강의 계획서 업로드
	@Override
	public void addFile(ClassSubjectFileDto classSubjectFileDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException {
		
		classSubjectFileDto.setClass_sub_no(class_sub_no);
		classSubjectFileDto.setSub_file_name(file.getOriginalFilename());
		classSubjectFileDto.setSub_file_type(file.getContentType());
		classSubjectFileDto.setSub_file_size(file.getSize());
		
		int sub_file_no = classSubjectDao.addFile(classSubjectFileDto);
		
		File taget = new File("D:/upload/final", String.valueOf(sub_file_no));
		file.transferTo(taget);
		
		
	}





}
