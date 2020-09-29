package com.kh.springFinal.service;

import java.util.List;

import com.kh.springFinal.entity.AttendanceDto;

public interface AttendanceService {


	// 출석 체크
	void attendCheck(List<String> attend_no, List<String> attend_type);

}
