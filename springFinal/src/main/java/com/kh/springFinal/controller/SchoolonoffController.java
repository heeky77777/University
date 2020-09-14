package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

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
	
	@GetMapping("/list")
	
	public String list() {
		
		return "schoolonoff/list";
				
	}
	
		
	@GetMapping("/off")
	public String schooloff() {
		return "schoolonoff/off";
	}
	@PostMapping("/off")
	public String schooloff(@ModelAttribute SchoolOffDto schoolOffDto, HttpSession session) {
		
		
		SchoolOffDto off= sqlSession.selectOne("school.numb",schoolOffDto);
		
		if(off==null) {
		sqlSession.insert("school.apply", schoolOffDto);
		session.setAttribute("userlist", schoolOffDto);
		return "redirect:list";
		}
		else {
			return "redirect:off?error";
		}
		
		
		
	}
	
	
	
	
	
}
