package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.SMCDto;

@Repository
public class ClassScoreDaoImpl implements ClassScoreDao{
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	SubjectApplyDao subjectApplyDao;
	
	@Autowired
	ClassSubjectDao classSubjectDao;
	
	//시퀀스 번호
	@Override
	public int getSeq() {
			return sqlSession.selectOne("score.seq");
		}

	//신청 강의 번호 
	@Override
	public int getClassSubNo() {
		return sqlSession.selectOne("score.getClassSubNo");
	}
	
	//점수 입력
	@Override
	public void write(ClassScoreDto classScoreDto) {
		int classScoreNo = this.getSeq();
		classScoreDto.setClass_score_no(classScoreNo);
		
		String class_sub_no = String.valueOf(this.getClassSubNo()); //수강생이 수강하고 있는 강의 번호
		if(class_sub_no!=null) { //null이 아니라면
			sqlSession.insert("score.regist");
			}
		}

	//수강학생 리스트
	@Override
	public List<SMCDto> StudentList(int class_sub_no){
		ClassSubjectDto classSubjectDto = classSubjectDao.getSub(class_sub_no); 
		int classSubNo = classSubjectDto.getClass_sub_no();
		return sqlSession.selectList("score.getStudentList", classSubNo);
	}
	
	//수정
	
}
