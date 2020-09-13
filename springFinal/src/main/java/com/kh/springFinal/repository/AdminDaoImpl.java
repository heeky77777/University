package com.kh.springFinal.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public AdminDto admin_login(AdminDto adminDto) {
		AdminDto admin = sqlSession.selectOne("admin.admin_login", adminDto);
		return admin;
	}
	
}
