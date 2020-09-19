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
}
