package com.kh.springFinal.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.ProfessorFileDto;
import com.kh.springFinal.repository.ProfessorDao;

@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public void add(ProfessorFileDto professorFileDto, MultipartFile file, int profe_no) throws IllegalStateException, IOException {
		
		
		professorFileDto.setProfe_no(profe_no);
		professorFileDto.setProfe_file_name(file.getOriginalFilename());
		professorFileDto.setProfe_file_type(file.getContentType());
		professorFileDto.setProfe_file_size(file.getSize());
	
		int no = professorDao.img_regist(professorFileDto);
		File target=new File("D:/upload",String.valueOf(no));
		file.transferTo(target);
	}
}
