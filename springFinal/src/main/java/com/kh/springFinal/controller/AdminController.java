package com.kh.springFinal.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.MajorDao;




@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MajorDao majorDao;
	
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@GetMapping("/major_add")
	public String major_add(Model model) {
		
		List<MajorDto> major_list = majorDao.major_list();
		model.addAttribute("major_list",major_list);
		return "admin/major_add";
	}
	
	@PostMapping("/major_add")
	public String major_add(@ModelAttribute MajorDto majorDto) {
		MajorDto major = majorDao.get(majorDto);
		
		if(major == null) {			
			majorDao.regist(majorDto);
			return "redirect:major_add";
		}
		else {
			return "redirect:major_add?error";
		}
	}
	
	@PostMapping("/major_delete")
	public String major_delete(@RequestParam int major_no) {
		majorDao.major_delete(major_no);
		
		return "redirect:major_add";
	}
	
	@GetMapping("/admin_student_edit")
	public String student_edit(@RequestParam int student_no,
								Model model) {
		StudentDto studentDto = sqlSession.selectOne("student.student_get", student_no);
		model.addAttribute("studentDto",studentDto);
		return "admin/admin_student_edit";
		
	}
	
	//학생 
	@GetMapping("/admin_student_list")
	public String student_list(Model model) {
		
		List<StudentDto> list = adminDao.student_list();
		model.addAttribute("student_list", list);
		
		return "admin/admin_student_list";
	}	

}
