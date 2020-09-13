package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.springFinal.entity.StudentinfoDto;



@Repository//영속성 작업을 처리하는 도구 (db, 파일 처리 따라서 sql 필요)
public class StudentinfoDaoImpl implements StudentinfoDao{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public boolean join(StudentinfoDto studentinfoDto) {
	StudentinfoDto find= sqlSession.selectOne("studentinfo.get",studentinfoDto.getStu_apply_phone());
			
	if(find==null) {
		sqlSession.insert("studentinfo.join", studentinfoDto);
		return true;
	}
	else {
		return false;
	}
	
	}

	@Override
	public StudentinfoDto get(String stu_apply_name) {
		StudentinfoDto find=sqlSession.selectOne("studentinfo.get",stu_apply_name);
		return find;
	}

	@Override
	public List<StudentinfoDto> getList() {

		List<StudentinfoDto> list = sqlSession.selectList("studentinfo.getList");
		return list;
	}
	
	
	
	
	}
