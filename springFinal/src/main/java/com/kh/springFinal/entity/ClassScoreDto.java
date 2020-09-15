
package com.kh.springFinal.entity;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClassScoreDto {

		
	private int class_score_no;
	private int subject_apply_no;
	private int profe_no;
	private int major_no;
	private int semester_no;
	private int class_score;
	private String class_score_type;
	private String class_score_date;
}

