package com.kh.springFinal.repository;

import com.kh.springFinal.entity.StudentDto;

public interface StudentDao {
	StudentDto login(StudentDto studentDto);
	StudentDto find_pw(StudentDto studentDto);
	StudentDto find_id(StudentDto studentDto);
}
