package com.kh.springFinal.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void class_apply(int class_sub_no, int major_no, int student_no, String subject_apply_name) {
		
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("class_sub_no", class_sub_no);
		map.put("major_no", major_no);
		map.put("student_no", student_no);
		map.put("subject_apply_name", subject_apply_name);
		
		sqlSession.insert("subjectApply.apply_class",map);
		
	}

	@Override
	public SubjectApplyDto get(int class_sub_no, int major_no, int student_no, String subject_apply_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("class_sub_no", class_sub_no);
		map.put("major_no", major_no);
		map.put("student_no", student_no);
		map.put("subject_apply_name", subject_apply_name);
		
		
		SubjectApplyDto subjectApply =sqlSession.selectOne("subjectApply.get_check", map);
		return subjectApply;
	}

	@Override
	public List<SubjectApplyDto> sub_list(SubjectApplyDto subjectApplyDto) {
		List<SubjectApplyDto> sub_list = sqlSession.selectList("subjectApply.sub_list", subjectApplyDto);
		return sub_list;
	}

	@Override
	public List<ClassSubjectDto> class_get(int class_sub_no) {
		List<ClassSubjectDto> classSubject = sqlSession.selectOne("subjectApply.class_list",class_sub_no);
		return classSubject;
	}

	@Override
	public List<ClassSubjectDto> all_class_list() {
		List<ClassSubjectDto> classSubject = sqlSession.selectList("subjectApply.all_class_list");
		return classSubject;
	}

	@Override
	public List<SubjectApplyDto> class_numb(SubjectApplyDto subjectApplyDto) {
		List<SubjectApplyDto> classSubject = sqlSession.selectList("subjectApply.class_numb");
		return classSubject;
	}

	@Override
	public List<ClassSubjectDto> st_class_apply_list(ClassSubjectDto classSubjectDto) {
		List<ClassSubjectDto> st_class_apply_list = sqlSession.selectList("subjectApply.st_class_apply_list",classSubjectDto);
		return st_class_apply_list;
	}

	@Override
	public void st_class_apply_list_del(int class_sub_no) {
		
		sqlSession.delete("subjectApply.st_class_apply_list_del", class_sub_no);
		
	}

	@Override
	public SubjectApplyDto get_subject(int class_sub_no, int student_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("class_sub_no", class_sub_no);
		map.put("student_no", student_no);
		
		SubjectApplyDto subject = sqlSession.selectOne("subjectApply.get_subject",map);
		
		return subject;
	}

	@Override
	public List<ClassSubjectDto> apply_check(ClassSubjectDto classSubjectDto) {
		List<ClassSubjectDto> classSubject = sqlSession.selectList("subjectApply.apply_check",classSubjectDto);
		return classSubject;
	}

}
