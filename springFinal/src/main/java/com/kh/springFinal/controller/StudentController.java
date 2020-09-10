package com.kh.springFinal.controller;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.SubjectApplyDao;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SubjectApplyDao subjectapplyDao;
	
	@GetMapping("/student_join")
	public String join() {
		return "student/student_join";
	}
	@PostMapping("/student_join")
	public String join(@ModelAttribute StudentDto studentDto) {
		StudentDto student = sqlSession.selectOne("student.numb", studentDto);
		
		if(student==null) {
			sqlSession.insert("student.signup", studentDto);
			return "redirect:student_join";
			
		}
		else {
			return "redirect:student_join?error";
		}
		
		
	}
	
	@GetMapping("/student_schedule")
	public String student_schedule() {
		return "student/student_schedule";
	}
	
	@GetMapping("/student_class_apply")
	public String student_class_apply(Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		return "student/student_class_apply";
	}
	
	@PostMapping("/subject_list")
	public String subject_list(@ModelAttribute ClassSubjectDto classSubjectDto,
								Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		List<ClassSubjectDto> apply_list = subjectapplyDao.get_list(classSubjectDto);
		model.addAttribute("apply_list", apply_list);
		
		return "student/student_class_apply";
	}
	
	@PostMapping("/student_class_apply")
	public String student_class_apply(@ModelAttribute SubjectApplyDto subjectApplyDto) {
		subjectapplyDao.class_apply(subjectApplyDto);
		return "redirect:student_class_apply";
	}
	
	
}	
	

