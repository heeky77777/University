package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StudentDto {
	
	private int student_no;
	private String student_name;
	private int student_numb;
	private String student_pw;
	private int student_grade;
	private String major_no;
	private String semester_no;
	private String student_state;
	private String student_gender;
	private String student_birth;
	private String student_phone;
	private String student_email;
	private String student_post;
	private String student_addr;
	private String student_extra_addr;
	private String student_auth;
	private String student_date;
	private String student_img;
	private String student_milliy;
	
	

}
