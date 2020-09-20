package com.kh.springFinal.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.springFinal.entity.SchoolOffDto;
import com.kh.springFinal.entity.SchoolReturnDto;

@Controller
@RequestMapping("/schoolonoff")
public class SchoolonoffController {

	@Autowired
	private SqlSession sqlSession;

	@GetMapping("/list")

	public String list(@ModelAttribute SchoolOffDto schoolOffDto, Model model) {
		SchoolOffDto off = sqlSession.selectOne("school.numb", schoolOffDto);

		model.addAttribute("off_list", off);
		return "schoolonoff/list";
 
	}

	@GetMapping("/result")
	public String result() {
		return "schooloff/result";
	}

	@GetMapping("/off")
	public String schooloff() {
		return "schoolonoff/off";
	}

	@PostMapping("/off")
	public String schooloff(@ModelAttribute SchoolOffDto schoolOffDto) {

		SchoolOffDto off = sqlSession.selectOne("school.numb", schoolOffDto);

		if (off == null) {
			sqlSession.insert("school.apply", schoolOffDto);

			return "schoolonoff/result";
		} else {
			return "redirect:off?error";
		}

	}

	@GetMapping("/on")
	public String schoolon() {
		return "schoolonoff/on";
	}

	@PostMapping("/on")
	public String schoolon(@ModelAttribute SchoolReturnDto schoolReturnDto, HttpSession session) {

		SchoolReturnDto on= sqlSession.selectOne("school.numb2", schoolReturnDto);
		
		if(on==null) {
		sqlSession.insert("school.return", schoolReturnDto);
		return "redirect:on";
		}
		else {
			return "redirect:on?error";
		}
	}
	@GetMapping("/list2")

	public String list2(@ModelAttribute SchoolReturnDto schoolReturnDto, Model model) {
		SchoolReturnDto on = sqlSession.selectOne("school.numb2", schoolReturnDto);

		model.addAttribute("on_list", on);
		return "schoolonoff/list2";

	}
}
