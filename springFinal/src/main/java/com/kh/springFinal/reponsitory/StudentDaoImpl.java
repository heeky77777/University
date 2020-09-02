package com.kh.springFinal.reponsitory;

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
		StudentDto student = sqlSession.selectOne("student.login",studentDto);
		return student;
	}


	@Override
	public StudentDto get_student_numb(StudentDto studenDto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
