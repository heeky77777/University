package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StudentFileDto {
	
	private int student_file_no;
	private int student_no;
	private String student_file_name;
	private String student_file_type;
	private long student_file_size;
	

}

