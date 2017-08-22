package com.spring.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.util.FileService;

@Controller
public class BookController {
	
	// 책 등록 Form
	@RequestMapping(value = "registBookForm", method = RequestMethod.GET)
	public String registBook() {
		return "/admin/registBook";
	}
}
