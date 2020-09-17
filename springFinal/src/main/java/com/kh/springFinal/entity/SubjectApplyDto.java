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
}
