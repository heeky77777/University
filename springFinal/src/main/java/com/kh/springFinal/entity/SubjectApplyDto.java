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
	private String semester_start;
	private String semester_type;
	private String class_sub_name;
	private String class_sub_type;
	private int class_sub_person;
	private int class_sub_point;
	private String class_sub_room;
	private String class_sub_week;
	private String class_sub_time1;
	private String class_sub_time2;
	private String class_sub_time3;
	private String class_sub_time4;
	

}
