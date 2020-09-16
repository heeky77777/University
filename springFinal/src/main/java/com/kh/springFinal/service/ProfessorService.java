package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorFileDto;

public interface ProfessorService {


	//업로드
	void add(ProfessorFileDto professorFileDto, MultipartFile file, int profe_no) throws IllegalStateException, IOException;

	//다운
	ResponseEntity<ByteArrayResource> getFile(int profe_file_no) throws IOException;

	//사진 번호
	ProfessorFileDto getFileNo(int profe_no) throws IOException;

	//사진 중복 확인 후 업로드
	void getEdit(int profe_no);



	

}
