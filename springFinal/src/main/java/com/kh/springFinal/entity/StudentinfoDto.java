package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class StudentinfoDto {

	private int stu_apply_no;
	private String stu_apply_name,stu_apply_gender,stu_apply_birth,stu_apply_phone,stu_apply_email,stu_apply_post,stu_apply_addr,
	stu_apply_extra_addr;
	
	
}
