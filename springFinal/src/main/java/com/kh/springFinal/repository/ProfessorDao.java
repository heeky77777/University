package com.kh.springFinal.repository;

import java.util.List;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;

public interface ProfessorDao {

	//시퀀스 
	int getSeq();

	//정보 등록 
	public void regist(ProfessorDto professorDto);
	
	//단일 조회
	public ProfessorDto get(int profe_no);
	
	//전체 조회
	public List<ProfessorDto> getList();

	//정보 수정
	public void update(ProfessorDto professorDto);
	
	//정보 삭제
	public void delete(ProfessorDto professorDto);

	//이미지 등록
	int add(ProfessorFileDto professorFileDto);

	/*
	 * //아이디 중복 검사 public ProfessorDto checkId(String profe_id);
	 * 
	 * //비밀번호 중복 검사 public boolean checkPw(String profe_pw);
	 */
	
}
