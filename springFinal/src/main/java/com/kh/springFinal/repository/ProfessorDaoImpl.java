package com.kh.springFinal.repository;

import java.util.List;

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
	public void regist(ProfessorDto professorDto) {
		sqlSession.insert("professor.regist",professorDto);
		
	}
	
	//단일 조회
	@Override
	public ProfessorDto get(int profe_no) {
		ProfessorDto professor=sqlSession.selectOne("professor.get",profe_no);
		return professor;
	}

	//목록 조회
	@Override
	public List<ProfessorDto> getList() {
		List<ProfessorDto> list = sqlSession.selectList("professor.getList");
		return list;
	}

	//정보 수정
	@Override
	public void update(ProfessorDto professorDto) {
		sqlSession.update("professor.update", professorDto);
	}
	
	//정보 삭제
	@Override
	public void delete(ProfessorDto professorDto) {
		sqlSession.delete("professor.delete",professorDto);
		
	}

	//교수 이미지 첨부
	@Override
	public int add(ProfessorFileDto professorFileDto) {
		int profe_file_no = sqlSession.selectOne("professorFile.seq");
		professorFileDto.setProfe_file_no(profe_file_no);
		sqlSession.insert("professorFile.add",professorFileDto);
		return profe_file_no;
	}


	
	/*
	 * //아이디 중복 검사
	 * 
	 * @Override public ProfessorDto checkId(String profe_id) { return
	 * sqlSession.selectOne("professor.getCheck", profe_id); }
	 * 
	 * //비밀번호 체크 여부
	 * 
	 * @Override public boolean checkPw(String profe_pw) { boolean result=false;
	 * Map<String,String> map=new HashMap<String,String>();
	 * map.put("profe_pw",profe_pw); map.put("profe_pw",profe_pw);
	 * 
	 * int count=sqlSession.selectOne("professor.checkPw",map); if(count==1)//비밀번호가
	 * 있으면 result=true; return result; }
	 */
	
}
