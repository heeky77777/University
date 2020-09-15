package com.kh.springFinal.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.repository.ProfessorDao;

@Service
public class ClassSubjectServiceImpl implements ClassSubjectService{
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	@Autowired
	private ProfessorDao professorDao;
	

	// 강의장 중복 검사
	@Override
	public ClassSubjectDto getConfirm(ClassSubjectDto classSubjectDto, String this_year, String semester_type) {
		
		SemesterDto semesterDto = classSubjectDao.getSemester(this_year, semester_type);
		classSubjectDto.setSemester_no(semesterDto.getSemester_no());
		
		return classSubjectDao.getConfirm(classSubjectDto);
		
	}	
	
	// 강의 등록
	@Override
	public int subjectRegist(ClassSubjectDto classSubjectDto, String this_year, String semester_type, HttpSession session) {
		
		SemesterDto semesterDto = classSubjectDao.getSemester(this_year, semester_type);
//		session.getAttribute("profeinfo");
//		ProfessorDto professorDto = professorDao.get(classSubjectDto.getProfe_no());
		ProfessorDto professorDto = classSubjectDao.getProfeName(classSubjectDto);
		
		classSubjectDto.setProfe_no(professorDto.getProfe_no());
		classSubjectDto.setMajor_no(professorDto.getMajor_no());
		classSubjectDto.setSemester_no(semesterDto.getSemester_no());
		
		int class_sub_no = classSubjectDao.subjectRegist(classSubjectDto);
		
		return class_sub_no;
	}
	
	
	// 강의 계획서 업로드
	@Override
	public void addFile(ClassSubjectFileDto classSubjectFileDto, MultipartFile file, int class_sub_no) throws IllegalStateException, IOException {
		
		classSubjectFileDto.setClass_sub_no(class_sub_no);
		classSubjectFileDto.setSub_file_name(file.getOriginalFilename());
		classSubjectFileDto.setSub_file_type(file.getContentType());
		classSubjectFileDto.setSub_file_size(file.getSize());
		
		int sub_file_no = classSubjectDao.addFile(classSubjectFileDto);
		
		File taget = new File("D:/upload/final", String.valueOf(sub_file_no));
		file.transferTo(taget);
		
		
	}

	// 강의 계획서 다운로드
	@Override
	public ResponseEntity<ByteArrayResource> getDown(int class_sub_no) throws IOException {
		
		ClassSubjectFileDto subFileDto = classSubjectDao.getFile(class_sub_no); 
		if(subFileDto == null) {
			return ResponseEntity.notFound().build();
		}
		else {
			File taget = new File("D:/upload/final", String.valueOf(subFileDto.getSub_file_no()));
			byte[] data = FileUtils.readFileToByteArray(taget);
			ByteArrayResource bres = new ByteArrayResource(data);
			
			return ResponseEntity
										.ok()
										.contentType(MediaType.APPLICATION_OCTET_STREAM)
										.contentType(MediaType.APPLICATION_PDF)
										.contentLength(subFileDto.getSub_file_size())
										.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+URLEncoder.encode(subFileDto.getSub_file_name(), "UTF-8")+"\"")
										.header(HttpHeaders.CONTENT_ENCODING, "utf-8")
										.body(bres);
		}
	}





}
