package com.kh.springFinal.repository;




import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;

@Repository
public class ProfessorDaoImpl implements ProfessorDao {

	
	@Autowired
	private SqlSession sqlSession;
	

	
	//시퀀스 번호
	@Override
	public int getSeq() {
		return sqlSession.selectOne("professor.seq");
	}
	
	
	//정보 등록
	@Override
	public int regist(ProfessorDto professorDto) {
		int profe_no=this.getSeq();
		professorDto.setProfe_no(profe_no);
		sqlSession.insert("professor.regist",professorDto);
		
		return profe_no;
	}
	
	
	//단일 조회(디테일)
	@Override
	public ProfessorDto get(int profe_no) {
		ProfessorDto professor=sqlSession.selectOne("professor.get",profe_no);
		return professor;
	}

	//아이디 단일 조회(아이디검사)
	@Override
	public ProfessorDto getId(String profe_id) {
		return sqlSession.selectOne("professor.getId", profe_id);
	}
	
	//학과명 가져오기
	@Override
	public String getMajor(int profe_no) {
		String major =sqlSession.selectOne("professor.getMajor",profe_no);
		return major;
	}
	
	//정보 삭제
	@Override
	public void delete(ProfessorDto professorDto) {
		sqlSession.delete("professor.delete",professorDto);
		
	}

	//이미지 시퀀스 
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



	
	
}
