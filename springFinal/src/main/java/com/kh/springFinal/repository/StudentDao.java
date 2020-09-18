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
	
	StudentFileDto student_check(int student_no); //중복되지 않게 저장하려고 만든거임 
	
	int student_file_add(StudentFileDto studentFileDto);
	
	//파일 다운로드 
//	StudentFileDto getFile(int student_file_no); // int받고 갤러리 토해내는
	StudentFileDto getFile(int student_no); // int받고 갤러리 토해내는
	
	void delFile(int student_no);

	
}
