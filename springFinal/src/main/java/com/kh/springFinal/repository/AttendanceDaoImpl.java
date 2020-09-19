package com.kh.springFinal.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.AttendanceDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 출결 시퀀스
	@Override
	public int getSeq() {
		return sqlSession.selectOne("attendance.attendSeq");
	}
	
	// 출결 번호 조회(중복 등록 방지)
	public AttendanceDto getAttendDto(AttendanceDto attendanceDto) {
		return sqlSession.selectOne("attendance.getAttend", attendanceDto);
	}
	

	// 출결 등록
	@Override
	public void attendRegist(AttendanceDto attendanceDto) {
		sqlSession.insert("attendance.attendRegist", attendanceDto);
	}
	
	// 수강 강의 날짜 조회
	@Override
	public List<SubjectApplyDto> getDateList(AttendanceDto attendanceDto) {

		return sqlSession.selectList("attendance.getSubApplyDate", attendanceDto);
	}
	
	// 수강 신청한 학생 목록(이름 가나다순)
	@Override
	public List<StudentDto> getStuList(int class_sub_no) {
		return sqlSession.selectList("attendance.getStudentApplyList", class_sub_no);
	}
	


	// 해당 수강에 대한 출결 타입 목록(이름 가나다순)
	@Override
	public List<AttendanceDto> getAttendTypeList(int class_sub_no) {
		
		return sqlSession.selectList("attendance.getAttendTypeList", class_sub_no);
	}

}
















