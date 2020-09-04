package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.MajorDto;

public interface MajorDao {

	void regist(MajorDto majorDto);
	List<MajorDto> major_list();
	MajorDto get(MajorDto majorDto);
	void major_delete(int major_no);
}
