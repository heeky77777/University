package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MajorDto {
	private int major_no;
	private String major_type;
	private String major_date;
	private int major_number;
	
}
