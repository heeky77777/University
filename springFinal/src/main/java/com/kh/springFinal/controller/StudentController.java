package com.kh.springFinal.controller;



import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.io.File;
import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.StudentFileuploadDto;
import com.kh.springFinal.repository.StudentDao;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.MajorDao;
import com.kh.springFinal.repository.SubjectApplyDao;


@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SubjectApplyDao subjectapplyDao;
	
	@Autowired
	private MajorDao majorDao;
	
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
	public String student_schedule(@ModelAttribute SubjectApplyDto subjectApplyDto,Model model) {
		
	List<SubjectApplyDto> sub_list = subjectapplyDao.sub_list(subjectApplyDto);
	
//	System.out.println("sub_list="+sub_list);
//	
//	for(SubjectApplyDto sjadto : sub_list) {
//		ClassSubjectDto csdto = subjectapplyDao.class_get(sjadto.getClass_sub_no());
//		model.addAttribute("csdto", csdto);
//		System.out.println("class_list="+csdto);
//	}

		
		return "student/student_schedule";
	}
	
	@GetMapping("/student_class_apply")
	public String student_class_apply(Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		List<MajorDto> majorList = majorDao.major_list();
		List<ClassSubjectDto> classList = subjectapplyDao.all_class_list();
		
		model.addAttribute("classList", classList);
		model.addAttribute("now_year", year);	
		model.addAttribute("majorList", majorList);
		return "student/student_class_apply";
	}
	
	@GetMapping("/subject_list")
	public String subject_list(Model model) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		model.addAttribute("now_year", year);
		return "student/subject_list";
	}
	
	@PostMapping("/subject_list")
	public String subject_list(@ModelAttribute ClassSubjectDto classSubjectDto,
								Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		List<ClassSubjectDto> apply_list = subjectapplyDao.get_list(classSubjectDto);
		List<MajorDto> majorList = majorDao.major_list();
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("apply_list", apply_list);
		
		return "student/subject_list";
	}
	
	@PostMapping("/student_class_apply")
	public String student_class_apply(@RequestParam int class_sub_no,
										@RequestParam int major_no,
										@RequestParam int student_no,
										@RequestParam String subject_apply_name,
										Model model) {
		
		SubjectApplyDto sub_check = subjectapplyDao.get(class_sub_no, major_no, student_no, subject_apply_name);
		model.addAttribute("sub_check",sub_check);
		
		if(sub_check==null) {
			subjectapplyDao.class_apply(class_sub_no, major_no, student_no, subject_apply_name);
			return "redirect:student_class_apply";
		}
		else {
			return "redirect:student_class_apply?error";
		}
		
	}
	
	@GetMapping("/st_class_apply_list")
	public String st_class_apply_list(Model model){
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
	
		model.addAttribute("now_year", year);
		
		return "student/st_class_apply_list";
	}
	
	
	@PostMapping("/st_class_apply_list")
	public String st_class_apply_list(@ModelAttribute ClassSubjectDto classSubjectDto,
										Model model) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		List<ClassSubjectDto> st_class_apply_list = subjectapplyDao.st_class_apply_list(classSubjectDto);
		List<MajorDto> majorList = majorDao.major_list();
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("st_class_apply_list",st_class_apply_list);
		return "student/st_class_apply_list";
	}
	
	@PostMapping("/st_class_apply_list_del")
	public String st_class_apply_list_del(@RequestParam int class_sub_no) {
		
		subjectapplyDao.st_class_apply_list_del(class_sub_no);
		
		return "redirect:st_class_apply_list";
	}
	
	@GetMapping("/student_info")
	public String info() {
		
		return "student/student_info";
	}
	
}

	
	
//	@PostMapping("/student_join")
//	public String regist(
//						@ModelAttribute ClassSubjectDto classSubjectDto,
//						@ModelAttribute StudentFileuploadDto studentfileuploadDto,
//						@RequestParam MultipartFile file) throws IllegalStateException, IOException {
//		
//		int class_sub_no = StudentDao.subjectRegist(classSubjectDto);
//		
//		classSubjectService.addFile(classSubjectFileDto, file, class_sub_no);
//		
//		
//		return "redirect:regist";
//	}
	
		

