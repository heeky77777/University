package com.kh.springFinal.reponsitory;

import com.kh.springFinal.entity.StudentDto;

public interface StudentDao {
	StudentDto login(StudentDto studentDto);
	StudentDto get_student_numb(StudentDto studenDto);
}
