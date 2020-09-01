package com.kh.springFinal.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassSubjectDto;

@Repository
public class ClassSubjectDaoImpl implements ClassSubjectDao{

	@Autowired
	private SqlSession sqlSseion;
	
	
	@Override
	public ClassSubjectDto getConfirm() {
		
		return sqlSseion.selectOne("classSubject.getConfirm");
	}
	
	@Override
	public void subjectRegist(ClassSubjectDto classSubjectDto) {
		
		sqlSseion.insert("classSubject.regist", classSubjectDto);
		
	}
	
}
