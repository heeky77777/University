package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class AttendanceDto {
	
	private int attend_no;
	private int suject_apply_no;
	private int student_no;
	private int profe_no;
	private int semester_no;
	private String attend_type;
	private String attend_date;
	
	
	private String student_name;
}
