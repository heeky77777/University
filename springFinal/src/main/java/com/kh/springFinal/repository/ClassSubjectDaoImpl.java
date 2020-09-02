package com.kh.springFinal.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;

@Repository
public class ClassSubjectDaoImpl implements ClassSubjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 강의실 강의 시간 중복 조회
	@Override
	public ClassSubjectDto getConfirm() {
		return sqlSession.selectOne("classSubject.getConfirm");
	}
	
	// 강의 등록
	@Override
	public int subjectRegist(ClassSubjectDto classSubjectDto) {
		
		int class_sub_no = sqlSession.selectOne("classSubject.subSeq");
		classSubjectDto.setClass_sub_no(class_sub_no);
		sqlSession.insert("classSubject.regist", classSubjectDto);
		
		return class_sub_no;
	}

	// 수업 계획서 파일 업로드
	@Override
	public int addFile(ClassSubjectFileDto classSubjectFileDto) {
		
		int sub_file_no = sqlSession.selectOne("subFile.seq");
		classSubjectFileDto.setSub_file_no(sub_file_no);
		sqlSession.insert("subFile.add", classSubjectFileDto);
		
		return sub_file_no;
	}
	
	
	
}
