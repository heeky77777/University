package com.kh.springFinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.springFinal.entity.AttendanceDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.AttendanceDao;

import lombok.extern.slf4j.Slf4j;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao attendanceDao;
	

	
	// 출석 체크
	@Override
	public void attendCheck(List<String> attend_no, List<String> attend_type) {
		
		for(int i = 0; i < attend_no.size(); i++) {

			attendanceDao.attendCheck(Integer.parseInt(attend_no.get(i)), attend_type.get(i));	
			
		}
		
	}
	
	
	
	
}











