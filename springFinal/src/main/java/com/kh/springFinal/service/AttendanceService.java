package com.kh.springFinal.service;

import java.util.List;

import com.kh.springFinal.entity.AttendanceDto;

public interface AttendanceService {

	// 출결 등록
	void attendRegist(AttendanceDto attendanceDto);

}
