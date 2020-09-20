package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.SMCDto;

@Repository
public class ClassScoreDaoImpl implements ClassScoreDao {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	SubjectApplyDao subjectApplyDao;

	@Autowired
	ClassSubjectDao classSubjectDao;

	// 시퀀스 번호
	@Override
	public int getSeq() {
		return sqlSession.selectOne("score.seq");
	}

	// 신청 강의 번호
	@Override
	public int getClassSubNo() {

		int class_sub_no = sqlSession.selectOne("score.getClassSubNo");

		return class_sub_no;
	}

	// 점수 입력
	@Override
	public void regist(ClassScoreDto classScoreDto) {
//		int classScoreNo = classScoreDto.getClass_score_no();
//		classScoreDto.setClass_score_no(classScoreNo);

		sqlSession.insert("score.regist", classScoreDto);

	}

	// 수강학생 리스트
	@Override
	public List<SMCDto> StudentList(int class_sub_no) {

		if (class_sub_no != 0) { // class_sub_no가 null이 아닌경우만
			List<SMCDto> list = sqlSession.selectList("score.getStudentList", class_sub_no);
			return list;
		} else {
			return null;
		}

	}

	// 수정
	@Override
	public void edit(ClassScoreDto classScoreDto){
		
		sqlSession.update("score.editScore");
	}
}
