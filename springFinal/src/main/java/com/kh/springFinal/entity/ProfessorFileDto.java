package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfessorFileDto {

	
	private int profe_file_no;
	private int profe_no;
	private String profe_file_name;
	private String profe_file_type;
	private long profe_file_size;

	}
	

