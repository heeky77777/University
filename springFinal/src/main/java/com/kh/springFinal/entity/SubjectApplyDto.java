package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SubjectApplyDto {
	private int subject_apply_no;
	private int class_sub_no;
	private int major_no;
	private int student_no;
	private String subject_apply_name;
	private String subject_apply_date;
	private String subject_apply_state;

	private String major_type;
	private int semester_no;
	private String semester_start;
	private String semester_type;
	private String class_sub_name;
	private String class_sub_type;
	private int class_sub_person;
	private int class_sub_point;
	private String class_sub_room;
	private String class_sub_week;
	private int class_sub_time1;
	private int class_sub_time2;
	private int class_sub_time3;
	private int class_sub_time4;
	
	
	private String searchDay;
	private String searchDate;
	
	private String student_name;
	private int student_numb;
	private int class_score;
	private String class_score_type;
	

}
