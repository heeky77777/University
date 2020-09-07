package com.kh.springFinal.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.SemesterDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ClassSubjectDaoImpl implements ClassSubjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	// 학기 조회
	@Override
	public SemesterDto getSemester(String this_year, String semester_type) {
		
		// 학기 번호 조회
		Map<String, Object> map = new HashMap<>();
		map.put("this_year", this_year);
		map.put("semester_type", semester_type);
		SemesterDto semesterDto = sqlSession.selectOne("classSubject.getSemester", map);
		
		return semesterDto;
	}
	
	// 강의실 강의 시간 중복 조회
	@Override
	public ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto) {
		
		ClassSubjectDto subDto = sqlSession.selectOne("classSubject.getConfirm", classSubjectDto);

		return subDto;
	}
	
	// 강의 등록
	@Override
	public int subjectRegist(ClassSubjectDto classSubjectDto) {
		
		ClassSubjectDto classSubjectCheck = sqlSession.selectOne("classSubject.getLecture", classSubjectDto);
		int class_sub_no;
		if(classSubjectCheck == null) {
			// 시퀀스 생성
			class_sub_no = sqlSession.selectOne("classSubject.subSeq");
			
			classSubjectDto.setClass_sub_no(class_sub_no);
			sqlSession.insert("classSubject.regist", classSubjectDto);
			return class_sub_no;
			
		}
		return 0;
		
	}

	
	// 수업 계획서 파일 업로드
	@Override
	public int addFile(ClassSubjectFileDto classSubjectFileDto) {
		
		int sub_file_no = sqlSession.selectOne("subFile.seq");
		classSubjectFileDto.setSub_file_no(sub_file_no);
		sqlSession.insert("subFile.add", classSubjectFileDto);
		
		return sub_file_no;
	}

	
	// 강의 리스트(전체)
	@Override
	public List<ClassSubjectDto> getList() {
		
		
		
		return  sqlSession.selectList("classSubject.lectureList");
	}

	
	// 강의 리스트 (교수)
	@Override
	public List<ClassSubjectDto> profList(int profe_no) {
		return sqlSession.selectList("classSubject.profList", profe_no);
	}


	
	
}
