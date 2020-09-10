package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.SemesterDto;

public interface ClassSubjectDao {
	
	// 강의실 중복확인
	ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto);

	// 학기 조회
	SemesterDto getSemester(String this_year, String semester_type);

	// 강의 단일 조회(번호로)
	ClassSubjectDto getSub(int class_sub_no);
	
	// 강의 조회(강의 중복 등록 방지)
	ClassSubjectDto getSubCheck(ClassSubjectDto classSubjectDto, String this_year, String semester_type);
	
	// 강의 등록
	int subjectRegist(ClassSubjectDto classSubjectDto);

	// 수업 계획서 업로드 
	int addFile(ClassSubjectFileDto classSubjectFileDto);
	
	// 강의 리스트
	List<ClassSubjectDto> getList();
	
	// 강의 검색
	List<ClassSubjectDto> getList(String yearSearch, String semesterSearch, String typeSearch, String majorSearch, String classSubSearch);
	
	// 강의 계획서 조회
	ClassSubjectFileDto getFile(int class_sub_no);

	// 강의 삭제
	void delete(int class_sub_no);

	// 강의 수정
	void classSubedit(ClassSubjectDto classSubjectDto);



	
	


}
