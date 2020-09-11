package com.kh.springFinal.repository;

import com.kh.springFinal.entity.AdminDto;

public interface AdminDao {
	AdminDto admin_login(AdminDto adminDto);
}
