package com.kh.springFinal.repository;



import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.entity.SemesterDto;

public interface ProfessorDao {

	//시퀀스 
	public int getSeq();
	
	//정보 여부 확인
	public int isExist();
	
	//정보 등록 
	void regist(ProfessorDto professorDto);
	
	//단일 조회
	public ProfessorDto get(int profe_no);
	
	//아이디 단일 조회(rest)
	public ProfessorDto getId(String profe_id);
	
	//전체 조회
	/* public List<ProfessorDto> getList(); */

	
	//학과명 가져오기
	public MajorDto getMajor(int profe_no);
	
	//학기명 가져오기
	public SemesterDto getSem(int profe_no);
	

	//이미지 번호
	public int getImg_seq();
	
	//이미지 등록
	int img_regist(ProfessorFileDto professorFileDto);



	
	
}
