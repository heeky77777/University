package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.AttendanceDto;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 출결 시퀀스
	@Override
	public int getSeq() {
		return sqlSession.selectOne("attendance.attendSeq");
	}
	
	
	// 출석 목록
	@Override
	public List<AttendanceDto> getList(int class_sub_no) {
		return sqlSession.selectList("attendance.getAttendList", class_sub_no);
	}


}
