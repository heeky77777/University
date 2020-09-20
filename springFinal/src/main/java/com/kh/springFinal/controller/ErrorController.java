package com.kh.springFinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@ControllerAdvice(annotations = {Controller.class})
public class ErrorController {
	
	
	@ExceptionHandler(ArithmeticException.class)
	public String handler1(){
		
		
		return"error/handler1";
	}
	
	@ExceptionHandler(NumberFormatException.class)
	public String handler2() {
		
		return"error/handler2";
	}
	
//	@ExceptionHandler(NumberFormatException.class)
	/*
	 * public String handler2() { return"error/handler2"; }
	 */
	

}
