package com.kh.springFinal.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.entity.SemesterDto;

@Repository
public class ProfessorDaoImpl implements ProfessorDao {

	@Autowired
	private SqlSession sqlSession;

	// 시퀀스 번호
	@Override
	public int getSeq() {
		return sqlSession.selectOne("professor.seq");
	}



	// 정보 등록
	@Override
	public void regist(ProfessorDto professorDto) {
		int profe_no = this.getSeq();// 시퀀스
		professorDto.setProfe_no(profe_no);
		sqlSession.insert("professor.regist", professorDto);	

	}

	// 단일 조회(디테일)
	@Override
	public ProfessorDto get(int profe_no) {
		ProfessorDto professor = sqlSession.selectOne("professor.get", profe_no);
		return professor;
	}

	// 아이디 단일 조회(아이디검사)
	@Override
	public ProfessorDto getId(String profe_id) {
		return sqlSession.selectOne("professor.getId", profe_id);
	}

	/*
	 * //정보 수정 public void update(int profe_no) {
	 * 
	 * ProfessorDto professorDto = sqlSession.update("professor.edit",profe_no); }
	 */

	// 학과명 가져오기
	@Override
	public MajorDto getMajor(int profe_no) {
		MajorDto majorDto = sqlSession.selectOne("professor.getMajor", profe_no);
		return majorDto;
	}

	// 이미지 시퀀스
	@Override
	public int getImg_seq() {
		return sqlSession.selectOne("profeFile.img_seq");
	}

	//교수 이미지 첨부
	@Override
	public int img_regist(ProfessorFileDto professorFileDto) {
		int profe_file_no = getImg_seq();
		professorFileDto.setProfe_file_no(profe_file_no);
		sqlSession.insert("profeFile.img_add",professorFileDto);
		return profe_file_no;
	}


	// 학기명 받아오기
	@Override
	public SemesterDto getSem(int profe_no) {
		SemesterDto semesterDto = sqlSession.selectOne("professor.getSem", profe_no);
		return semesterDto;
	}

	// 로그인
	@Override
	public ProfessorDto profe_login(ProfessorDto professorDto) {
		ProfessorDto professor = sqlSession.selectOne("professor.profe_login", professorDto);
		return professor;
	}

	@Override
	public ProfessorFileDto getFile(int profe_no) {

		return sqlSession.selectOne("profeFile.getFile", profe_no);
	}



	@Override
	public void delFile(int profe_no) {
		
		sqlSession.delete("profeFile.del_profe_file",profe_no);
	}

}
