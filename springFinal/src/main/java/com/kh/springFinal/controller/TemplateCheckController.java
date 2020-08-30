package com.kh.springFinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template")
public class TemplateCheckController {

	@GetMapping("/header")
	public String header() {
		return "template/header";
	}
}
