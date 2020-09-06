package com.kh.springFinal.entity;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private List<MultipartFile> file;
	
	public boolean isFile() {
		
		if(file == null) return false;
		if(file.size() < 1) return false;
		if(file.get(0).isEmpty()) return false;
			
		return true;
	}


}
