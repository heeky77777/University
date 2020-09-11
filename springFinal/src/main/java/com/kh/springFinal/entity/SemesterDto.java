package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class SemesterDto {

	private int semester_no;
	private String semester_start;
	private String semester_finish;
	private String semester_type;

}


