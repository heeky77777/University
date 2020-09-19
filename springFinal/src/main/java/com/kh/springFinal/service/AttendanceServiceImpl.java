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
@Slf4j
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao attendanceDao;
	
	// 출석 등록 및 타입 조회
	@Override
	public void attendRegist(AttendanceDto attendanceDto) {
		
		// 해당 수강의 날짜 조회
		List<SubjectApplyDto> applyDateList = attendanceDao.getDateList(attendanceDto);
		// 수강 신청 학생 번호 조회
		List<StudentDto> attendanceStuList = attendanceDao.getStuList(attendanceDto.getClass_sub_no());
		
			
		for (int j = 0; j < attendanceStuList.size(); j++) {
			attendanceDto.setStudent_no(attendanceStuList.get(j).getStudent_no());
			
			for (int i = 0; i < applyDateList.size(); i++) {
				attendanceDto.setAttend_date(applyDateList.get(i).getSearchDate()); 

				// 시퀀스 번호
				int attendSeq = attendanceDao.getSeq();
				
				// 출결 번호 조회 (중복 등록 방지)
				AttendanceDto getAttendDto = attendanceDao.getAttendDto(attendanceDto);
				log.info("getAttendDto= {}", getAttendDto);
				
				// 출결 중복 등록 확인
				if(getAttendDto == null) {
					attendanceDto.setAttend_no(attendSeq);
					log.info("attendanceDto= {}", attendanceDto);
					attendanceDao.attendRegist(attendanceDto);
				}
			}
			
		}
		
	}

	
	// 출석 체크
	@Override
	public void attendCheck(List<String> attend_no, List<String> attend_type) {
		
		for(int i = 0; i < attend_no.size(); i++) {

			attendanceDao.attendCheck(Integer.parseInt(attend_no.get(i)), attend_type.get(i));	
			
		}
		
	}
	
	
	
	
}











