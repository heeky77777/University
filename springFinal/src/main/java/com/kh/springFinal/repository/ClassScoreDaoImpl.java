package com.kh.springFinal.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.SubjectApplyDto;

import lombok.extern.slf4j.Slf4j;

@Repository

@Slf4j
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
	public void regist(int subject_apply_no, int student_no, int class_score, String class_score_type) {
//		int classScoreNo = classScoreDto.getClass_score_no();
//		classScoreDto.setClass_score_no(classScoreNo);
		
		log.info("subject_apply_no = {}", subject_apply_no);
		log.info("student_no = {}", student_no);
		log.info("class_score = {}", class_score);
		log.info("subject_apply_no = {}", class_score_type);
		
		Map<String, Object> map = new HashMap<>();
		map.put("subject_apply_no", subject_apply_no);
		map.put("student_no", student_no);
		map.put("class_score", class_score);
		map.put("class_score_type", class_score_type);
		

		sqlSession.insert("score.regist", map);
	}

	// 수강학생 리스트
	@Override
	public List<ClassScoreDto> StudentList(int class_sub_no) {

		return sqlSession.selectList("score.getClassSubNo", class_sub_no);

	}

	// 수정
	@Override
	public void edit(ClassScoreDto classScoreDto){
		
		sqlSession.update("score.editScore");
	}
}
