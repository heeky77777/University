package com.kh.springFinal.rest;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.SchoolOffDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.StudentDao;

@RestController
@RequestMapping("/adminRest")
public class AdminRestController {

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/update")
	public void update(@RequestParam int student_no) {
		
	 sqlSession.update("admin.update", student_no);
		
	}
	
	@GetMapping("/delete")
	public void delete(@RequestParam int student_no) {
		
		sqlSession.delete("admin.delete", student_no);
	
	}
	
	@GetMapping("/update2")
	public void update2(@RequestParam int student_no) {
		sqlSession.update("admin.update2",student_no);
	}
	
	@GetMapping("/delete2")
	public void delete2(@RequestParam int student_no) {
		
		sqlSession.delete("admin.delete2", student_no);
	
	}
	
}
