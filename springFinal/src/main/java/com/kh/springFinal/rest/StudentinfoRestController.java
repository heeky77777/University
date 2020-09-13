package com.kh.springFinal.rest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.springFinal.entity.StudentinfoDto;



@RestController//@Controller + @ResponseBody
@RequestMapping("/test")
@CrossOrigin("*")//아무나 들어와도 데이터를 주겠다는 뜻
public class StudentinfoRestController {

	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/test8")
	public StudentinfoDto test8(@RequestParam String stu_apply_phone) {
		StudentinfoDto studentDto = 
						sqlSession.selectOne("studentinfo.get", stu_apply_phone);
		return studentDto;
	}

}
