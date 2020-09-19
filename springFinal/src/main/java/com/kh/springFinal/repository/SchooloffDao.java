package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.SchoolOffDto;



public interface SchooloffDao {

	
	List<SchoolOffDto> getList();
	
	
	// 휴학리스트 삭제
	
	void delete(int student_no);
	
}
