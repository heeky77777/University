package com.kh.springFinal.rest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.MajorDao;
import com.kh.springFinal.repository.StudentDao;
import com.kh.springFinal.repository.StudentinfoDao;
import com.kh.springFinal.repository.SubjectApplyDao;

@RestController
@RequestMapping("/apply")
public class SubjectApplyRestController {
	@Autowired
	private SubjectApplyDao subjectApplyDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MajorDao majorDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("get_semester")
	public SemesterDto get_semester(@ModelAttribute SemesterDto semesterDto) {
		SemesterDto semester = subjectApplyDao.get_semester(semesterDto);
		return semester;
	}
	
	@GetMapping("get_major")
	public MajorDto get_major(@ModelAttribute MajorDto majorDto) {
		MajorDto major = majorDao.get(majorDto);
		return major;
	}
	
	@GetMapping("/get_std_number")
	public List<StudentDto> get_std_number(@ModelAttribute StudentDto studentDto){
		List<StudentDto> student = adminDao.get_major_list(studentDto);
		return student;
	}
	
	@GetMapping("/subject_list")
	public List<ClassSubjectDto> subject_list(@ModelAttribute ClassSubjectDto classSubjectDto,
								Model model) {
		
		List<ClassSubjectDto> apply_list = subjectApplyDao.get_list(classSubjectDto);
		model.addAttribute("apply_list", apply_list);
		
		return apply_list;
	}
	
//	@GetMapping("/apply_class")
//	public void apply_class(@RequestParam int class_sub_no,
//								@RequestParam int major_no,
//								@RequestParam int student_no,
//								@RequestParam String subject_apply_name,	
//							Model model) { 
//		System.out.println();
//		SubjectApplyDto sub_check = subjectApplyDao.get(class_sub_no, major_no, student_no, subject_apply_name);
////		model.addAttribute("sub_check",sub_check);
//		
//		if(sub_check==null) {
//			subjectApplyDao.class_apply(class_sub_no, major_no, student_no, subject_apply_name);
////			return "redirect:student_class_apply";
//		}
//		else {
////			return "redirect:student_class_apply?error";
//		}
//	}
	
	@GetMapping("/st_class_apply_list_del")
	public void st_class_apply_list_del(@RequestParam int class_sub_no) {
		
		subjectApplyDao.st_class_apply_list_del(class_sub_no);
		
		
	}
	
	
//	@GetMapping("/class_numb")
//	public List<ClassSubjectDto> class_numb(@RequestParam int class_sub_no) {
//		List<ClassSubjectDto> class_list_numb = subjectApplyDao.class_numb(class_sub_no);
//		
//		return class_list_numb;
//	}
	
}
