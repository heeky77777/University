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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	private StudentDao studentDao;
	
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
	public String student_schedule(Model model) {		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		   return "student/student_schedule";
		}
	@PostMapping("/student_schedule")
	public String student_scheduel(@ModelAttribute ClassSubjectDto classSubjectDto,Model model) {
		ClassSubjectDto[][] data= new ClassSubjectDto[9][6];
		   List<ClassSubjectDto> list = studentDao.get_schedule(classSubjectDto);
//		   data에 list에 있는 값을 칸에 맞게 저장
		   
		   for(ClassSubjectDto dto : list){
			   
//		      dto의 시간을 조회
			   String week = dto.getClass_sub_week();
			   int sub_time1 = Integer.parseInt(dto.getClass_sub_time1());
			   int sub_time2 = Integer.parseInt(dto.getClass_sub_time2());
			   int sub_time3 = Integer.parseInt(dto.getClass_sub_time3());
//			   int sub_time4 = Integer.parseInt(dto.getClass_sub_time4());
			   String sub_name = dto.getClass_sub_name();
			   
//		      dto를 data에 추가(위치에 맞게)
//		      data[?][?] = dto;
			   for(int i=1; i<=8; i++) {				   
				   if(week.equals("월") && sub_time1 == i) { 
					   data[i][1] = dto;
				   }
				   if(week.equals("화") && sub_time1 == i) { 
					   data[i][2] = dto;
				   }
				   if(week.equals("수") && sub_time1 == i) { 
					   data[i][3] = dto;
				   }
				   if(week.equals("목") && sub_time1 == i) { 
					   data[i][4] = dto;
				   }
				   if(week.equals("금") && sub_time1 == i) { 
					   data[i][5] = dto;
				   }
				   
				   if(week.equals("월") && sub_time2 == i) { 
					   data[i][1] = dto;
				   }
				   if(week.equals("화") && sub_time2 == i) { 
					   data[i][2] = dto;
				   }
				   if(week.equals("수") && sub_time2 == i) { 
					   data[i][3] = dto;
				   }
				   if(week.equals("목") && sub_time2 == i) { 
					   data[i][4] = dto;
				   }
				   if(week.equals("금") && sub_time2 == i) { 
					   data[i][5] = dto;
				   }
				   
				   if(week.equals("월") && sub_time3 == i) { 
					   data[i][1] = dto;
				   }
				   if(week.equals("화") && sub_time3 == i) { 
					   data[i][2] = dto;
				   }
				   if(week.equals("수") && sub_time3 == i) { 
					   data[i][3] = dto;
				   }
				   if(week.equals("목") && sub_time3 == i) { 
					   data[i][4] = dto;
				   }
				   if(week.equals("금") && sub_time3 == i) { 
					   data[i][5] = dto;
				   }
			   }

			  }
		   model.addAttribute("schedule", data);
		   return "student/student_schedule";
		   }
	

//	List<ClassSubjectDto> schedul = studentDao.get_schedule(classSubjectDto);
//	model.addAttribute("schedul",schedul);

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
	public String subject_list_get(@ModelAttribute ClassSubjectDto classSubjectDto,
									@RequestParam int major_no,
									@RequestParam int student_no,
									@RequestParam int semester_no,
									@RequestParam int regist_date,
									Model model,
									RedirectAttributes attr) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		List<ClassSubjectDto> apply_list = subjectapplyDao.get_list(classSubjectDto);
		List<ClassSubjectDto> apply_check = subjectapplyDao.apply_check(classSubjectDto);
		List<MajorDto> majorList = majorDao.major_list();
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("apply_list", apply_list);
		model.addAttribute("apply_check", apply_check);
		model.addAttribute("now_year", year);
		
		attr.addAttribute("regist_date",regist_date);
		attr.addAttribute("major_no",major_no);
		attr.addAttribute("semester_no",semester_no);
		attr.addAttribute("student_no",student_no);
		
		return "student/subject_list";
	}
	
	@PostMapping("/subject_list")
	public String subject_list_post(@ModelAttribute ClassSubjectDto classSubjectDto,
									@RequestParam int major_no,
									@RequestParam int student_no,
									@RequestParam int semester_no,
									@RequestParam int regist_date,
								Model model,
								RedirectAttributes attr) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		model.addAttribute("now_year", year);	
		
		List<ClassSubjectDto> apply_list = subjectapplyDao.get_list(classSubjectDto);
		List<MajorDto> majorList = majorDao.major_list();
		List<ClassSubjectDto> apply_check = subjectapplyDao.apply_check(classSubjectDto);
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("apply_list", apply_list);
		model.addAttribute("apply_check", apply_check);
		
		attr.addAttribute("regist_date",regist_date);
		attr.addAttribute("major_no",major_no);
		attr.addAttribute("semester_no",semester_no);
		attr.addAttribute("student_no",student_no);
		
		return "student/subject_list";
	}
	
	@PostMapping("/student_class_apply")
	public String student_class_apply(@RequestParam int class_sub_no,
										@RequestParam int major_no,
										@RequestParam int student_no,
										@RequestParam String subject_apply_name,
										@RequestParam int semester_no,
										@RequestParam int regist_date,
										@ModelAttribute ClassSubjectDto classSubjectDto,
										RedirectAttributes attr ,Model model) {
		
		SubjectApplyDto sub_check = subjectapplyDao.get(class_sub_no, major_no, student_no, subject_apply_name);
		model.addAttribute("sub_check",sub_check);
		
		if(sub_check==null) {
			subjectapplyDao.class_apply(class_sub_no, major_no, student_no, subject_apply_name);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			
			
						
			attr.addAttribute("regist_date",regist_date);
			attr.addAttribute("major_no",major_no);
			attr.addAttribute("semester_no",semester_no);
			attr.addAttribute("student_no",student_no);
	
			return "redirect:subject_list";
		}
		else {
			attr.addAttribute("regist_date",regist_date);
			attr.addAttribute("major_no",major_no);
			attr.addAttribute("semester_no",semester_no);
			attr.addAttribute("student_no",student_no);
			return "redirect:subject_list?error";
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
	
	@GetMapping("/student_apply_wait")
	public String student_apply_wait() {
		
		return "student/student_apply_wait";
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
	
		

