package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ClassSubjectFileDto {
	
	private int sub_file_no;
	private int class_sub_no;
	private String sub_file_name;
	private String sub_file_type;
	private long sub_file_size;

}
