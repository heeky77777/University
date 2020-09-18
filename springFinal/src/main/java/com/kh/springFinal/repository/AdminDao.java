package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.AdminDto;
import com.kh.springFinal.entity.StudentDto;

public interface AdminDao {
	AdminDto admin_login(AdminDto adminDto);

	List<StudentDto> student_list();
}
