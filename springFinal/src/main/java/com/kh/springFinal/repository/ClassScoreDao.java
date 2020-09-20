package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.SMCDto;

public interface ClassScoreDao {

	//시퀀스
	int getSeq();

	//등록
	void regist(ClassScoreDto classScoreDto);

	//수강 학생 리스트
	List<SMCDto> StudentList(int class_sub_no);

	//신청 강의 번호
	int getClassSubNo();

	//수정
	void edit(ClassScoreDto classScoreDto);
}
