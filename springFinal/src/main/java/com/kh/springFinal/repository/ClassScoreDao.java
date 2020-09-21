package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.SubjectApplyDto;

public interface ClassScoreDao {

	//시퀀스
	int getSeq();

	//등록
	void regist(int subject_apply_no, int student_no, int class_score, String class_score_type);

	//수강 학생 리스트
	List<ClassScoreDto> StudentList(int class_sub_no);

	//신청 강의 번호
	int getClassSubNo();


	//수정
	void edit(ClassScoreDto classScoreDto);

}
