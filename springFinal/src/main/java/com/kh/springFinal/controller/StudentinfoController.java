package com.kh.springFinal.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.springFinal.entity.StudentinfoDto;
import com.kh.springFinal.repository.StudentinfoDao;



@Controller
@RequestMapping("/client")
public class StudentinfoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/result")
	public String result() {
		return "client/result";
	}
	
	@GetMapping("/error")
	public String result2() {
		return "client/error";
	}
	
	@GetMapping("/join")
	public String join() {
		return "client/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute StudentinfoDto studentinfoDto) {
		StudentinfoDto studentinfo=sqlSession.selectOne("studentinfo.get", studentinfoDto);
		
		if(studentinfo==null) {
		sqlSession.insert("studentinfo.join", studentinfoDto);
		return "redirect:result";
	}
		else {
			return "redirect:error";
					
		}
	
	
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		List<StudentinfoDto> list = sqlSession.selectList("studentinfo.getList");
		model.addAttribute("list", list);
		
//		return "/WEB-INF/views/board/list.jsp";
		return "client/list";
}
	@RequestMapping("/union")
	public String union(
			@RequestParam(required=false) String type,
			@RequestParam(required=false) String keyword,
			Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		List<StudentinfoDto> list = sqlSession.selectList("studentinfo.unionList", map);
		model.addAttribute("list", list);
		
		return "client/list";
	}
			
	
	
}
