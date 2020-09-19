package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.ProfessorDto;
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
	int subjectRegist(ClassSubjectDto classSubjectDto, String this_year, String semester_type);

	// 강의 계획서 업로드 
	int addFile(ClassSubjectFileDto classSubjectFileDto);
	
	// 강의 리스트
	List<ClassSubjectDto> getList();
	
	// 로그인 교수 강의 리스트
	List<ClassSubjectDto> getList(int loginProfeNo);
	
	// 강의 검색
	List<ClassSubjectDto> getList(String yearSearch, String semesterSearch, String typeSearch, String majorSearch, String classSubSearch);
	
	// 수강 등록 강의 중 해당 교수 강의 
	List<ClassSubjectDto> geApplyMytList(int profe_no);
	
	// 수강 목록 검색 (교수)
	List<ClassSubjectDto> geApplyMytList(int profe_no, String yearSearch, String semesterSearch, String typeSearch, String classSubSearch);
	
	// 강의 계획서 조회
	ClassSubjectFileDto getFile(int class_sub_no);

	// 강의 삭제
	void delete(int class_sub_no);

	// 강의 수정
	void classSubEdit(ClassSubjectDto classSubjectDto);

	// 파일 삭제(강의 계획서 삭제)
	void deleteFile(ClassSubjectFileDto classSubjectFileDto);

	// 교수 학과 조회
	ProfessorDto getProfeMajor(ProfessorDto professorDto);








}
