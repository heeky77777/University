
package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfessorDto {

	private int profe_no;
	private int major_no;
	private int semester_no;
	private String profe_name;
	private String profe_id;
	private String profe_pw;
	private String profe_gender;
	private String profe_birth;
	private String profe_phone; 
	private String profe_email;
	private String profe_post;
	private String profe_addr;
	private String profe_extra_addr;
	private String profe_auth;
	private String profe_date;


	

