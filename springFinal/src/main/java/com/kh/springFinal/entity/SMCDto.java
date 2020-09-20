package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SMCDto {

	private int student_numb;
	private String student_name;
	private	String major_type;
	private int class_score;
	private String class_score_type;
	private int class_sub_no;
	private int student_no;
	
	//디티오추가 아웃터조인
	private String class_sub_name;
}
