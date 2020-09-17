package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Data @NoArgsConstructor @Builder
public class SchoolReturnDto {

	private int school_return_no, student_no;
	
	private String school_return_date, school_return_type;
	
	
}
