package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;

public interface ClassSubjectDao {
	
	// 강의실 중복확인
	ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto);

	// 강의 등록
	int subjectRegist(ClassSubjectDto classSubjectDto);

	// 수업 계획서 업로드 
	int addFile(ClassSubjectFileDto classSubjectFileDto);

	// 강의 리스트(전체)
	List<ClassSubjectDto> getList();
	
	// 강의 리스트 (로그인 교수)
	List<ClassSubjectDto> profList(int profe_no);

}
