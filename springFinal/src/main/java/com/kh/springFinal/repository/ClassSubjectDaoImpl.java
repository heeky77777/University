package com.kh.springFinal.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.SemesterDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ClassSubjectDaoImpl implements ClassSubjectDao{

	@Autowired
	private SqlSession sqlSession;

	// 강의 단일 조회(번호로 조회)
	@Override
	public ClassSubjectDto getSub(int class_sub_no) {
		return sqlSession.selectOne("classSubject.get", class_sub_no);
	}
	
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
	
	
	// 강의 조회(중복 조회)
	@Override
	public ClassSubjectDto getSubCheck(ClassSubjectDto classSubjectDto, String this_year, String semester_type) {
		
		SemesterDto semester_no = this.getSemester(this_year, semester_type);
		classSubjectDto.setSemester_no(semester_no.getSemester_no());		
		
		ClassSubjectDto subCheck = sqlSession.selectOne("classSubject.getCheckSub", classSubjectDto);
		
		return subCheck;
	}
	
	
	// 강의 등록
	@Override
	public int subjectRegist(ClassSubjectDto classSubjectDto, String this_year, String semester_type) {
		
		
		// 교수 강의 중복 검자(등록시 해당요일에 같은 시간에 등록 되어 있는지)
		ClassSubjectDto classSubCheck = this.getSubCheck(classSubjectDto, this_year, semester_type);

		if(classSubCheck == null) {
			// 시퀀스 생성
			int  class_sub_no = sqlSession.selectOne("classSubject.classSubSeq");
			classSubjectDto.setClass_sub_no(class_sub_no);
			
			sqlSession.insert("classSubject.regist", classSubjectDto);
			return class_sub_no;
		}
		
		return 0;
		
	}

	
	// 수업 계획서 파일 업로드
	@Override
	public int addFile(ClassSubjectFileDto classSubjectFileDto) {
		
		int sub_file_no = sqlSession.selectOne("classSubFile.seq");
		classSubjectFileDto.setSub_file_no(sub_file_no);
		sqlSession.insert("classSubFile.add", classSubjectFileDto);
		
		return sub_file_no;
	}
	
	
	// 강의 리스트
	@Override
	public List<ClassSubjectDto> getList() {
		return  sqlSession.selectList("classSubject.getNameList");
	}
	
	// 로그인 교수 강의 리스트
	@Override
	public List<ClassSubjectDto> getList(int loginProfeNo) {
		
		List<ClassSubjectDto> list = sqlSession.selectList("classSubject.mySubjctList", loginProfeNo);
		
		return list;
	}
	
	// 강의 검색
	@Override
	public List<ClassSubjectDto> getList(String yearSearch, String semesterSearch, String typeSearch,	String majorSearch, String classSubSearch) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("yearSearch", yearSearch);
		map.put("semesterSearch", semesterSearch);
		map.put("typeSearch", typeSearch);
		map.put("majorSearch", majorSearch);
		map.put("classSubSearch", classSubSearch);

		List<ClassSubjectDto> searchList = sqlSession.selectList("classSubject.searchClassSub", map);
		
		return searchList;
	}

	// 수강 등록 강의 중 해당 교수 강의
	@Override
	public List<ClassSubjectDto> geApplyMytList(int profe_no) {
		return sqlSession.selectList("classSubject.applyMyList", profe_no);
	}
	
	// 수강 강의 목록 검색(교수)
	@Override
	public List<ClassSubjectDto> geApplyMytList(int profe_no, String yearSearch, String semesterSearch, String typeSearch,
			String classSubSearch) {
		
		Map<String , Object> map = new HashMap<>();
		map.put("profe_no", profe_no);
		map.put("yearSearch", yearSearch);
		map.put("semesterSearch", semesterSearch);
		map.put("typeSearch", typeSearch);
		map.put("classSubSearch", classSubSearch);
		
		List<ClassSubjectDto> applySearchList = sqlSession.selectList("classSubject.applySearchMyList", map);
		
		return applySearchList;
	}
	
	// 강의 계획서 조회
	@Override
	public ClassSubjectFileDto getFile(int class_sub_no) {
		return sqlSession.selectOne("classSubFile.get", class_sub_no);
	}

	
	// 강의 삭제
	@Override
	public void delete(int class_sub_no) {
		sqlSession.delete("classSubject.classSubDel", class_sub_no);		
	}
	
	// 강의 수정
	@Override
	public void classSubEdit(ClassSubjectDto classSubjectDto) {
		
		sqlSession.update("classSubject.classSubEdit", classSubjectDto);
	}

	// 강의 계획서 삭제
	@Override
	public void deleteFile(ClassSubjectFileDto classSubjectFileDto) {
		ClassSubjectFileDto checkFileDto =  sqlSession.selectOne("classSubFile.get", classSubjectFileDto.getClass_sub_no());
		sqlSession.delete("classSubFile.delete", checkFileDto);
	}

	
	// 교수 학과 조회
	@Override
	public ProfessorDto getProfeMajor(ProfessorDto professorDto) {
		return sqlSession.selectOne("classSubject.getProfeMajor", professorDto);
	}

	// 관리자 강의 검색
	@Override
	public List<ClassSubjectDto> getList(String yearSearch, String semesterSearch, String typeSearch,	
														String profeSearch, String majorSearch, String classSubSearch) {
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("yearSearch", yearSearch);
		map.put("semesterSearch", semesterSearch);
		map.put("typeSearch", typeSearch);
		map.put("profeSearch", profeSearch);
		map.put("majorSearch", majorSearch);
		map.put("classSubSearch", classSubSearch);
		
		return  sqlSession.selectList("classSubject.AdminSearchClassSub", map);
	}

	
	
}
