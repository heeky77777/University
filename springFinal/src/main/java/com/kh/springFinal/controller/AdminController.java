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

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SchoolOffDto;
import com.kh.springFinal.entity.SchoolReturnDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.ClassSubjectDao;
import com.kh.springFinal.repository.MajorDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MajorDao majorDao;

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ClassSubjectDao classSubjectDao;
	
	@Autowired
	private SqlSession sqlSession;





	@GetMapping("/major_add")
	public String major_add(Model model) {

		List<MajorDto> major_list = majorDao.major_list();
		model.addAttribute("major_list", major_list);
		return "admin/major_add";
	}

	@PostMapping("/major_add")
	public String major_add(@ModelAttribute MajorDto majorDto) {
		MajorDto major = majorDao.get(majorDto);

		if (major == null) {
			majorDao.regist(majorDto);
			return "redirect:major_add";
		} else {
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
	
	@PostMapping("/admin_student_edit")
	public String student_edit(@ModelAttribute StudentDto studentDto) {
		
		sqlSession.update("admin.student_edit", studentDto);
		
		return "admin/admin_student_edit";		 
	}
	
	//학생 
	@GetMapping("/admin_student_list")
	public String student_list(Model model) {
		
		List<StudentDto> list = adminDao.student_list();
		model.addAttribute("student_list", list);
		
		return "admin/admin_student_list";
	}	
	

	@GetMapping("/off_list")
	public String list(Model model) {
		List<SchoolOffDto> list = sqlSession.selectList("admin.off_List");

		model.addAttribute("list", list);

		return "admin/off_list";

	}




	@GetMapping("/on_list")
	public String oNlist(Model model) {
		List<SchoolReturnDto> list = sqlSession.selectList("admin.on_List");

		model.addAttribute("list", list);

		return "admin/on_list";

	}



	@RequestMapping("/union")
	public String union(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			Model model) {
		Map<String, Object> map = new HashMap<>(); 
		map.put("type", type);
		map.put("keyword", keyword);

		List<SchoolOffDto> list = sqlSession.selectList("admin.unionList", map);
		model.addAttribute("list", list);

		return "admin/off_list";
	}
	
	
	@RequestMapping("/union2")
	public String union2(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);

		List<SchoolReturnDto> list = sqlSession.selectList("admin.unionList2", map);
		model.addAttribute("list", list);

		return "admin/on_list";
	}
	
	
	// 강의 목록
	@GetMapping("classSubList")
	public String classSubList(Model model) {
		
		List<MajorDto> majorList = majorDao.major_list();
		List<ClassSubjectDto> classSubList = classSubjectDao.getList();
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("classSubList", classSubList);
		
		return "admin/classSubList";
	}

	

	// 강의 검색
	@PostMapping("classSubList")
	public String classSubSearchList(
							@RequestParam (required = false, defaultValue = "null") String yearSearch,
							@RequestParam (required = false, defaultValue = "all") String semesterSearch,
							@RequestParam (required = false, defaultValue = "all") String typeSearch,
							@RequestParam (required = false, defaultValue = "null") String profeSearch,
						    @RequestParam (required = false, defaultValue = "all") String majorSearch,
							@RequestParam (required = false, defaultValue = "null") String classSubSearch,
							Model model) {
		
		List<MajorDto> majorList = majorDao.major_list();
		List<ClassSubjectDto> classSubList = classSubjectDao.getList(yearSearch, semesterSearch, typeSearch, profeSearch, majorSearch, classSubSearch);
		
		model.addAttribute("majorList", majorList);
		model.addAttribute("classSubList", classSubList);
		
		return "admin/classSubList";
	}
	
	
	
	
	
}


















