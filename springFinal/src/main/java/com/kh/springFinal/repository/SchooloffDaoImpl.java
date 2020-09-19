package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.springFinal.entity.SchoolOffDto;


public class SchooloffDaoImpl implements SchooloffDao {
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<SchoolOffDto> getList() {
		// TODO Auto-generated method stub
		List<SchoolOffDto> list = sqlSession.selectList("school.getList");
		return list;
	}
	
	public void delete(int student_no) {
		sqlSession.delete("admin.delete", student_no);		
	}
	
	
}
