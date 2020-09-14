package com.kh.springFinal.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.StudentDto;

@Repository
public class StudentDaoImpl implements StudentDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public StudentDto login(StudentDto studentDto) {
		StudentDto student = sqlSession.selectOne("student.student_login", studentDto);
		return student;
	}

	@Override
	public StudentDto find_pw(StudentDto studentDto) {
		StudentDto student_pw = sqlSession.selectOne("student.student_pw", studentDto);
		return student_pw;
	}

	@Override
	public StudentDto find_id(StudentDto studentDto) {
		StudentDto student_id = sqlSession.selectOne("student.student_id", studentDto);
		return student_id;
	}
	
	

	
}
