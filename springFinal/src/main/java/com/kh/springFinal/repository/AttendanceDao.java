package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.AttendanceDto;

public interface AttendanceDao {

	// 출결 시퀀스
	int getSeq();
	
	// 출결 목록
	List<AttendanceDto> getList(int class_sub_no);

}
