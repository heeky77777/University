package com.kh.springFinal.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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

import com.kh.springFinal.entity.ClassScoreDto;
import com.kh.springFinal.entity.SMCDto;
import com.kh.springFinal.entity.SubjectApplyDto;
import com.kh.springFinal.repository.ClassScoreDao;
import com.kh.springFinal.service.ClassScoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/score")
@Slf4j
public class ClassScoreController {

	@Autowired
	private ClassScoreDao classScoreDao;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ClassScoreService classScoreService;


	@GetMapping("/list/{class_sub_no}/{subject_apply_no}")
	public String list(
					@PathVariable int class_sub_no,
					@PathVariable int subject_apply_no, 
					Model model, RedirectAttributes attr) {
		
		
		List<ClassScoreDto> StudentList = classScoreDao.StudentList(class_sub_no);
		System.out.println("StudentList = " + StudentList);
		model.addAttribute("StudentList", StudentList);

		attr.addAttribute("class_sub_no", class_sub_no);
		attr.addAttribute("subject_apply_no", subject_apply_no);
		return "score/list";
	}

//	@PostMapping("/list")
//	public String list(@RequestParam int class_sub_no, @ModelAttribute SMCDto smcDto, Model model,
//			RedirectAttributes attr) {
//
//		log.info("class_sub_no={}", class_sub_no);
//		List<SMCDto> StudentList = classScoreDao.StudentList(class_sub_no);
//		model.addAttribute("studentList", StudentList);
//
//		attr.addAttribute("class_sub_no", class_sub_no);
//		return "redirect:/score/insert";
//
//	}

	
	  @GetMapping("/insert/{class_sub_no}/{subject_apply_no}") 
	  public String getStudentList(@PathVariable int class_sub_no, @PathVariable int subject_apply_no, 
			  						@ModelAttribute ClassScoreDto classScoreDto, Model model, RedirectAttributes attr) {
	  
		  List<ClassScoreDto> StudentList = classScoreDao.StudentList(class_sub_no);
	 
		  model.addAttribute("StudentList", StudentList);
		attr.addAttribute("class_sub_no", class_sub_no);
		attr.addAttribute("subject_apply_no", subject_apply_no);
	  
	  return "score/insert"; 
	  
	  }
	 
	@PostMapping("/insert/{class_sub_no}/{subject_apply_no}")
	public String StudScoreRegist(
							@PathVariable int class_sub_no,
							@PathVariable int subject_apply_no,
							@RequestParam List<String> student_no,
							@RequestParam List<String> class_score,
							@RequestParam List<String> class_score_type,
							Model model, RedirectAttributes attr ) {

		// 1. smcDto 교수가 입력한 점수, 등급 등 성적 테이블에 추가해야 할 정보가 들어옴. -> smcDto
		// 2. 그러면 해당 교수가 입력한 성적의 대상인 학생의 번호를 이용해서 해당 학생의 정보를 받아와야 해. -> smcDto 학생 번호 ->
		// studentDto 조회
		// 3. 교수가 입력한 데이터 + 학생번호로 조회한 학생 정보 = classScoreDto
//		ClassScoreDto classScore = ClassScoreDto.builder().subject_apply_no(classScoreDto.getSubject_apply_no()).student_no(classScoreDto.getStudent_no())
//												.class_score(classScoreDto.getClass_score()).class_score_type(classScoreDto.getClass_score_type()).build();
		
//		classScoreDao.regist(classScoreDto);
		
		System.out.println("=============================================");
		System.out.println("student_no = " + student_no);
		System.out.println("=============================================");
		System.out.println("class_score = " + class_score);
		System.out.println("=============================================");
		
		classScoreService.scoreRegist(subject_apply_no, student_no, class_score, class_score_type);
		

//		attr.addAttribute("class_sub_no", class_sub_no);
		return "redirect:/score/list/"+ class_sub_no + "/" + subject_apply_no;

	}

//	@GetMapping("/edit")
//	public String EditList(@RequestParam int class_sub_no, @ModelAttribute SMCDto smcDto, Model model,
//			RedirectAttributes attr) {
//
//		List<SMCDto> StudentList = classScoreDao.StudentList(class_sub_no);
//		model.addAttribute("StudentList", StudentList);
//
//	
//		return "score/insert";
//	 }
//	 

	 @GetMapping("/mylist")
		public String list(Model model, @RequestParam int student_no) {
			List<SMCDto> list = sqlSession.selectList("score.on_list", student_no);
			
			model.addAttribute("mylist", list);

			return "score/mylist";
	 }

	@PostMapping("/edit")
	public String getEditList(@ModelAttribute SMCDto smcDto, Model model,
			RedirectAttributes attr) {
//		ClassScoreDto classScoreDto = ClassScoreDto.builder().class_score(smcDto.getClass_score())
//										.class_score_type(smcDto.getClass_score_type())
//										.build();
//		classScoreDao.edit(classScoreDto);

		//attr.addAttribute(attributeValue);
		return "redirect:score/list";
	}
}