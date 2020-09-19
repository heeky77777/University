package com.kh.springFinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.springFinal.entity.AttendanceDto;
import com.kh.springFinal.entity.StudentDto;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.AttendanceDao;
import com.kh.springFinal.service.AttendanceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attendance")
@Slf4j
public class AttendanceController {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private AttendanceService attendanceService;
	
	// 출결 목록
	@GetMapping("attendList/{class_sub_no}/{subject_apply_no}")
	public String attenList(
							@PathVariable int class_sub_no,
							@PathVariable int subject_apply_no,
							@ModelAttribute AttendanceDto attendanceDto,
							Model model, RedirectAttributes attr) {
		
		log.info("attendanceDto = {}", attendanceDto);
		
		// 출결 등록
		attendanceService.attendRegist(attendanceDto);
		// 학생 목록 출력
		List<StudentDto> attendanceStuList = attendanceDao.getStuList(class_sub_no);
		// 출결 타입
		List<AttendanceDto> attendanceTypeList = attendanceDao.getAttendTypeList(class_sub_no);
		// 수업 일 조회
		List<SubjectApplyDto> applyDateList = attendanceDao.getDateList(attendanceDto);
		
		model.addAttribute("applyDateList", applyDateList);
		model.addAttribute("attendanceStuList", attendanceStuList);
		model.addAttribute("attendanceTypeList", attendanceTypeList);
		
		attr.addAttribute("class_sub_no", class_sub_no);
		attr.addAttribute("subject_apply_no", subject_apply_no);
		
		return "attendance/attendList";
	}
	
	
	// 출석 체크
	@PostMapping("attendList/{class_sub_no}/{subject_apply_no}")
	public String attendList(
								@RequestParam List<String> attend_no,
								@RequestParam List<String> attend_type) {
		
		System.out.println("-----------------------------------");
		log.info("attend_no = {}", attend_no.size());
		System.out.println("-----------------------------------");
		log.info("attend_type = {}", attend_type.size());
		System.out.println("-----------------------------------");
		
		return "redirect:/attendance/attendList";
	}
	
	
	
}






















