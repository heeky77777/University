package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchoolOffDto {

	private int school_off_no, student_no ;
	
	private String  school_off_regist ,school_off_type, school_off_regist_date, school_off_period;
	
	private String student_name;
	private int student_numb;
	private String major_no;
	
	
	
	
}
