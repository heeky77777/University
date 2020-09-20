package com.kh.springFinal.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.kh.springFinal.entity.AdminDto;
import com.kh.springFinal.entity.ProfessorDto;
import com.kh.springFinal.entity.StudentDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		StudentDto studentDto = (StudentDto) session.getAttribute("userinfo");
		ProfessorDto professorDto = (ProfessorDto) session.getAttribute("profeinfo");
		AdminDto adminDto = (AdminDto) session.getAttribute("admin");
		
		
		log.info("=====================");
		log.info("session = {}", session);
		log.info("=====================");
		log.info("studentDto = {}", studentDto);
		log.info("=====================");
		log.info("professorDto = {}", professorDto);
		log.info("=====================");
		log.info("adminDto = {}", adminDto);
		log.info("=====================");
		
		
		boolean isLogin = studentDto != null || professorDto != null || adminDto != null;
		
		
		if(!isLogin) {
			resp.sendRedirect(req.getContextPath()+"/");
		}
			chain.doFilter(request, response);
		
		
	}
	
	

}
