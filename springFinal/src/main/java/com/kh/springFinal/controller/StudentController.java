package com.kh.springFinal.controller;



import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.ClassSubjectFileDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.StudentFileDto;
import com.kh.springFinal.repository.StudentDao;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.MajorDao;
import com.kh.springFinal.repository.SubjectApplyDao;
import com.kh.springFinal.service.StudentService;


@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private SubjectApplyDao subjectapplyDao;
	
	@Autowired
	private MajorDao majorDao;
	
	@Autowired
	private StudentDao studentDao;
	
	@GetMapping("/student_join")
	public String join(Model model) {
		List<MajorDto> majorList = majorDao.major_list();
		
		model.addAttribute("majorList", majorList);
		
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
		List<MajorDto> majorList = majorDao.major_list();
		
		model.addAttribute("now_year", year);	
		model.addAttribute("majorList", majorList);
		return "student/student_class_apply";
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
		
		return "student/student_class_apply";
	}
	
	@PostMapping("/student_class_apply")
	public String student_class_apply(@ModelAttribute SubjectApplyDto subjectApplyDto,
										Model model) {
		
		SubjectApplyDto sub_check = subjectapplyDao.get(subjectApplyDto);
		model.addAttribute("sub_check",sub_check);
		
		if(sub_check==null) {
			subjectapplyDao.class_apply(subjectApplyDto);
			return "redirect:student_class_apply";
		}
		else {
			return "redirect:student_class_apply?error";
		}
		
	}
	
	@GetMapping("/student_info")
	public String info(@RequestParam int student_no,
						Model model) {

		StudentDto studentDto = sqlSession.selectOne("student.student_get", student_no);
		model.addAttribute("studentDto",studentDto);
		return "student/student_info";
	}
	
	@GetMapping("/student_edit")
	public String edit(@RequestParam int student_no,
					Model model) {
		
		StudentDto studentDto = sqlSession.selectOne("student.student_get", student_no);
		
		model.addAttribute("studentDto",studentDto);
		return "student/student_edit";
	}
	
	@PostMapping("/student_edit")
	public String edit(@ModelAttribute StudentDto studentDto) {
		
		sqlSession.update("student.change", studentDto);
		
		return "student/student_info";		 
	}
	
	//파일업로드
	@PostMapping("/student_info")
	public String studentfile(@ModelAttribute StudentFileDto studentFileDto,
								@RequestParam MultipartFile file,
								@RequestParam int student_no,
								RedirectAttributes attr) throws IllegalStateException, IOException {
		
		studentService.fileupload(studentFileDto, file, student_no);
		attr.addAttribute("student_no", student_no);
		
		return "redirect:student_info"; 
		
	}
	
	// 파일 다운로드 
	@GetMapping("/studentImg/{student_no}")
	@ResponseBody
	public void Filedown(
			@PathVariable int student_no,
			HttpServletResponse response
			) throws IOException{
		
	StudentFileDto studentFileDto = studentDao.getFile(student_no);
	
	if(studentFileDto==null) {
		response.sendError(404);
		return;
	}
	response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
	response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(studentFileDto.getStudent_file_name(), "UTF-8")+"\"");
	response.setHeader("Content-Length", String.valueOf(studentFileDto.getStudent_file_size()));
	
	
	
	
	
	File target = new File("D:/upload1", String.valueOf(studentFileDto.getStudent_file_no()));
	byte[]data = FileUtils.readFileToByteArray(target);
	response.getOutputStream().write(data);
	}
			
}

