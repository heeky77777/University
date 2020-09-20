package com.kh.springFinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.springFinal.repository.ClassScoreDao;

@Service
public class ClassScoreServiceImpl implements ClassScoreService{
	
	@Autowired
	private ClassScoreDao classScoreDao;

	
	@Override
	public void scoreRegist(int subject_apply_no, List<String> student_no, List<String> class_score, List<String> class_score_type) {
		
		for(int i = 0; i < student_no.size(); i++) {
			
			classScoreDao.regist(subject_apply_no, Integer.parseInt(student_no.get(i)), Integer.parseInt(class_score.get(i)), class_score_type.get(i));
			
		}
		
	}
	
}
