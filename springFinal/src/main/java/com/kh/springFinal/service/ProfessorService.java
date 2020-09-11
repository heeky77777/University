package com.kh.springFinal.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorFileDto;

public interface ProfessorService {



	void add(ProfessorFileDto professorFileDto, MultipartFile file, int profe_no) throws IllegalStateException, IOException;

}
