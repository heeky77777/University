package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ClassSubjectDto {
	
	private int class_sub_no;
	private int profe_no;
	private int major_no;
	private int semester_no;
	private String class_sub_name;
	private String class_sub_type;
	private String class_sub_content;
	private int class_sub_person;
	private String class_sub_start;
	private String class_sub_end;
	private int class_sub_point;
	private String class_sub_room;
	private String class_sub_week;
	private int class_sub_time;
	private int start_time;
	private int end_time;
	private String regist_date;


}