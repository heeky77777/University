package com.kh.springFinal.repository;

import java.util.List;


import com.kh.springFinal.entity.StudentinfoDto;

public interface StudentinfoDao {

	
	boolean join(StudentinfoDto studentinfoDto);
	
	

	StudentinfoDto get(String stu_apply_name);
	List<StudentinfoDto> getList();
	
	
	
}
