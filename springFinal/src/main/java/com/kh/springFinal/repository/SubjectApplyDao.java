package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.entity.SubjectApplyDto;

public interface SubjectApplyDao {
	SemesterDto get_semester(SemesterDto semesterDto);
	List<ClassSubjectDto> get_list(ClassSubjectDto classSubjectDto);
	List<ClassSubjectDto> get_profe_name();
	void class_apply(SubjectApplyDto subjectApplyDto);
	SubjectApplyDto get(SubjectApplyDto subjectApplyDto);
	
	
	// 로그인 교수 수강 목록
	List<SubjectApplyDto> profeList(int profe_no);
	
}
