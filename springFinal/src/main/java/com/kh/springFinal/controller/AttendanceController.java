package com.kh.springFinal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.springFinal.entity.AttendanceDto;
import com.kh.springFinal.repository.AttendanceDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attendance")
@Slf4j
public class AttendanceController {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	// 출결 목록
	@GetMapping("attendList/{class_sub_no}")
	public String attenList(@PathVariable int class_sub_no, Model model, RedirectAttributes attr) {
		
		List<AttendanceDto> attendanceList = attendanceDao.getList(class_sub_no);
		
		log.info("attendanceList = {}", attendanceList);
		
		model.addAttribute("attendanceList", attendanceList);
		attr.addAttribute("class_sub_no", class_sub_no);
		
		return "attendance/attendList";
	}
	
}
