package com.kh.springFinal.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.springFinal.entity.MajorDto;

@Repository
public class MajorDaoImpl implements MajorDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(MajorDto majorDto) {
		
		sqlSession.insert("admin.major_regist",majorDto);
	}

	@Override
	public List<MajorDto> major_list() {
		List<MajorDto> majorDto = sqlSession.selectList("admin.major_list");
		return majorDto;
	}

	@Override
	public MajorDto get(MajorDto majorDto) {
		MajorDto major = sqlSession.selectOne("admin.major_get",majorDto);
		return major;
	}

	@Override
	public void major_delete(int major_no) {
		sqlSession.delete("admin.major_delete", major_no);
		
	}

	@Override
	public MajorDto get_major(int major_no) {
		MajorDto majorDto = sqlSession.selectOne("studentinfo.get_major",major_no);
		return majorDto;
	}

}
