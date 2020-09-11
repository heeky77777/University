package com.kh.springFinal.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.ClassSubjectDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SemesterDto;
import com.kh.springFinal.repository.MajorDao;
import com.kh.springFinal.repository.SubjectApplyDao;

@RestController
@RequestMapping("/apply")
public class SubjectApplyRestController {
	@Autowired
	private SubjectApplyDao subjectApplyDao;
	
	
	@Autowired
	private MajorDao majorDao;
	
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
	
	@GetMapping("/subject_list")
	public List<ClassSubjectDto> subject_list(@ModelAttribute ClassSubjectDto classSubjectDto,
								Model model) {
		
		List<ClassSubjectDto> apply_list = subjectApplyDao.get_list(classSubjectDto);
		model.addAttribute("apply_list", apply_list);
		
		return apply_list;
	}
	
}
