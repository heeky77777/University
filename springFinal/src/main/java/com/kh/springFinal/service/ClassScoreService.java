package com.kh.springFinal.service;

import java.util.List;

public interface ClassScoreService {

	// 성적 등록
	void scoreRegist(int subject_apply_no, List<String> student_no, List<String> class_score, List<String> class_score_type);

}
