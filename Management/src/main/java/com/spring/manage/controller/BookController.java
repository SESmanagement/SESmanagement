package com.spring.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.service.BookService;
import com.spring.manage.service.MemberService;
import com.spring.manage.util.FileService;
import com.spring.manage.vo.BookVO;


@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService service;
	
	final String uploadPath = "/booksImage";
	
	// 책 등록 Form
	@RequestMapping(value = "registBookForm", method = RequestMethod.GET)
	public String registBook() {
		return "/admin/registBook";
	}
	
	//책 등록
	@RequestMapping(value = "/registBook", method = RequestMethod.POST)
	public String registBook(BookVO vo, MultipartFile upload) {
		// 책 이미지 저장
		if (upload.getOriginalFilename().length() > 0) {
			String img_src = FileService.saveFile(uploadPath, upload, vo.getTitle() + "_" + vo.getAuthor());
			vo.setImg_src(img_src);
		}
		service.insert(vo);
		return "admin/lendList";
	}
}
