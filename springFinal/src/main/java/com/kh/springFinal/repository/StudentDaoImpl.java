package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.StudentFileDto;

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
	
	@Override
	public int student_file_add(StudentFileDto studentFileDto) {
		int student_file_no = sqlSession.selectOne("student_seq");
		studentFileDto.setStudent_file_no(student_file_no);
		sqlSession.insert("student.student_file",studentFileDto);
		return student_file_no;
	}

		
	
	@Override
	public List<StudentDto> getList(StudentDto studentDto) {
		List<StudentDto> list = sqlSession.selectList("student_list");
		
		return list;
	}
	
	@Override
	public StudentFileDto student_check(int student_no) {
//		sqlSession.selectOne(student_no);
		
		return null;
	}

	@Override
	public StudentDto list(StudentDto studentDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentDto student_list(StudentDto studentDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudentDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//파일 다운로드
//	@Override
//	public StudentFileDto getFile(int student_file_no) {
//		StudentFileDto studentFileDto = sqlSession.selectOne("student.student_file_get",student_file_no);
//		return studentFileDto;
//	}
	@Override
	public StudentFileDto getFile(int student_no) {
		StudentFileDto studentFileDto = sqlSession.selectOne("student.student_file_get",student_no);
		return studentFileDto;
	}

	@Override
	public void delFile(int student_no) {
		sqlSession.delete("student.student_file_del",student_no);
		
	}

	@Override
	public List<ClassSubjectDto> get_schedule(ClassSubjectDto classSubjectDto) {
		List<ClassSubjectDto> classSubject = sqlSession.selectList("schedule.get_schedule",classSubjectDto);
		return classSubject;
	}

	
}
