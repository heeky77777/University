package com.kh.springFinal.repository;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;

public interface ClassSubjectDao {

	ClassSubjectDto getConfirm();

	int subjectRegist(ClassSubjectDto classSubjectDto);

	int addFile(ClassSubjectFileDto classSubjectFileDto);

}
