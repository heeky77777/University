package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.AttendanceDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;

public interface AttendanceDao {

	// 출결 시퀀스
	int getSeq();

	// 출결 번호 조회(중복 등록 방지)
	AttendanceDto getAttendDto(AttendanceDto attendanceDto);
	
	// 출력 등록
	void attendRegist(AttendanceDto attendanceDto);
	
	// 출석 체크
	void attendCheck(int attend_no, String attend_type);
	
	// 수강 강의 날짜 조회
	List<SubjectApplyDto> getDateList(AttendanceDto attendanceDto);
	
	// 해당 수강에 대한 출결 타입 목록(이름 가나다순)
	List<AttendanceDto> getAttendTypeList(int class_sub_no);

	// 수강 신청한 학생 목록(이름 가나다순)
	List<StudentDto> getStuList(int class_sub_no);



	
}
