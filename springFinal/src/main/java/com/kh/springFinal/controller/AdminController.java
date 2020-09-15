package com.kh.springFinal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.springFinal.entity.AdminDto;
import com.kh.springFinal.entity.MajorDto;
import com.kh.springFinal.entity.SchoolOffDto;
import com.kh.springFinal.entity.StudentinfoDto;
import com.kh.springFinal.repository.AdminDao;
import com.kh.springFinal.repository.MajorDao;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MajorDao majorDao;
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
	
	@GetMapping("/off_list")
	public String list(Model model) {
		List<SchoolOffDto> list = sqlSession.selectList("admin.off_List");
		
		model.addAttribute("list", list);
		
		return "admin/off_list";

}
	
	@RequestMapping("/union")
	public String union(
			@RequestParam(required=false) String type,
			@RequestParam(required=false) String keyword,
			Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		List<SchoolOffDto> list = sqlSession.selectList("admin.unionList", map);
		model.addAttribute("list", list);
		
		return "admin/off_list";
	}
}