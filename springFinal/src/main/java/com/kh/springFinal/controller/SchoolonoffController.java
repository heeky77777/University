package com.kh.springFinal.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.SchoolOffDto;

@Controller
@RequestMapping("/schoolonoff")
public class SchoolonoffController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/off")
	public String schooloff() {
		return "schoolonoff/off";
	}
	@PostMapping("/off")
	public String schooloff(@ModelAttribute SchoolOffDto schoolOffDto) {
		
		
		SchoolOffDto off= sqlSession.selectOne("school.numb",schoolOffDto);
		
		if(off==null) {
		sqlSession.insert("school.apply", schoolOffDto);
		return "redirect:off";
		}
		else {
			return "redirect:off?error";
		}
		
	}
}
