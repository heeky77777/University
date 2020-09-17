package com.kh.springFinal.repository;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.entity.SubjectApplyDto;

public interface SubjectApplyDao {
	SemesterDto get_semester(SemesterDto semesterDto);
	
	List<ClassSubjectDto> get_list(ClassSubjectDto classSubjectDto);
	
	List<ClassSubjectDto> get_profe_name();
	
	void class_apply(int class_sub_no, int major_no, int student_no, String subject_apply_name);
	
	SubjectApplyDto get(int class_sub_no, int major_no, int student_no, String subject_apply_name);
	
	List<SubjectApplyDto> sub_list(SubjectApplyDto subjectApplyDto);
	
	List<ClassSubjectDto> class_get(int class_sub_no);
	
	List<ClassSubjectDto> all_class_list();
	
	List<SubjectApplyDto> class_numb(SubjectApplyDto subjectApplyDto);
	
	List<ClassSubjectDto> st_class_apply_list(ClassSubjectDto classSubjectDto);
	
	void st_class_apply_list_del(int class_sub_no);
	
	SubjectApplyDto get_subject(int class_sub_no, int student_no);
	
//	List<ClassSubjectDto> get_list_after(ClassSubjectDto classSubjectDto);
	
}
