
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
	private int student_no;
	private String class_score;
	private String class_score_type;
	private String class_score_date;

	private String student_name;
	private int student_numb;
	private String semester_type;
	private int semester_no;
	private int class_sub_no;
	private String class_sub_name;
}

