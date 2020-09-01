package com.kh.springFinal.repository;

import com.kh.springFinal.entity.ClassSubjectDto;

public interface ClassSubjectDao {

	ClassSubjectDto getConfirm();

	void subjectRegist(ClassSubjectDto classSubjectDto);

}
