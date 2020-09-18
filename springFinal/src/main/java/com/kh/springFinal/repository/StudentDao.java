package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.StudentDto;

public interface StudentDao {
	StudentDto login(StudentDto studentDto);
	StudentDto find_pw(StudentDto studentDto);
	StudentDto find_id(StudentDto studentDto);
	List<ClassSubjectDto> get_schedule(ClassSubjectDto classSubjectDto);
	
}
