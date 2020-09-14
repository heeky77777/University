package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.entity.SubjectApplyDto;

@Repository
public class SubjectApplyDaoImpl implements SubjectApplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SemesterDto get_semester(SemesterDto semesterDto) {
		SemesterDto semester = sqlSession.selectOne("subjectApply.get_semester", semesterDto);
		return semester;
	}

	@Override
	public List<ClassSubjectDto> get_list(ClassSubjectDto classSubjectDto) {
		List<ClassSubjectDto> classapply = sqlSession.selectList("subjectApply.apply_list", classSubjectDto);
		return classapply;
	}

	@Override
	public List<ClassSubjectDto> get_profe_name() {
		
		return sqlSession.selectList("subjectApply.get_profeName");
	}

	@Override
	public void class_apply(SubjectApplyDto subjectApplyDto) {
		sqlSession.insert("subjectApply.apply_class",subjectApplyDto);
		
	}

	@Override
	public SubjectApplyDto get(SubjectApplyDto subjectApplyDto) {
		SubjectApplyDto subjectApply =sqlSession.selectOne("subjectApply.get_check",subjectApplyDto);
		return subjectApply;
	}

	@Override
	public List<SubjectApplyDto> sub_list(SubjectApplyDto subjectApplyDto) {
		List<SubjectApplyDto> sub_list = sqlSession.selectList("subjectApply.sub_list", subjectApplyDto);
		return sub_list;
	}

	@Override
	public ClassSubjectDto class_get(int class_sub_no) {
		ClassSubjectDto classSubject = sqlSession.selectOne("subjectApply.class_list",class_sub_no);
		return classSubject;
	}

}
