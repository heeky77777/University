package com.kh.springFinal.repository;


import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;

public interface ProfessorDao {

	//시퀀스 
	public int getSeq();

	//정보 등록 
	public int regist(ProfessorDto professorDto);
	
	//단일 조회
	public ProfessorDto get(int profe_no);
	
	//단일 아이디 조회
	public ProfessorDto getId(String profe_id);
	
	//전체 조회
	/* public List<ProfessorDto> getList(); */

	
	//정보 삭제
	public void delete(ProfessorDto professorDto);

	//이미지 번호
	public int getImg_seq();
	
	//이미지 등록
	int img_regist(ProfessorFileDto professorFileDto);


	
	
}
