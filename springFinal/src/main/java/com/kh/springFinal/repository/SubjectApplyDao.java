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
	
	List<SubjectApplyDto> sub_list(SubjectApplyDto subjectApplyDto);
	ClassSubjectDto class_get(int class_sub_no);
}
