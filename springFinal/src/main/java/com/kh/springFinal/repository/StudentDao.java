package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.StudentFileDto;

public interface StudentDao {
	StudentDto login(StudentDto studentDto);
	StudentDto find_pw(StudentDto studentDto);
	StudentDto find_id(StudentDto studentDto);
	StudentDto list(StudentDto studentDto);
	StudentDto student_list(StudentDto studentDto);
	List<StudentDto> getList();
	List<StudentDto> getList(StudentDto studentDto);
	
	StudentFileDto student_check(int student_no);
	
	int student_file_add(StudentFileDto studentFileDto);
}
