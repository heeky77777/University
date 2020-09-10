package com.kh.springFinal.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdminDto {

	private int admin_no;
	private String admin_id;
	private String admin_pw;
	private String admin_auth;
}
