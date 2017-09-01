package com.spring.manage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.manage.service.BookService;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.BookVO;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService service;

	
	// 책 등록 Form
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "/book/writeForm";
	}
	
	// 게시글 등록
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BookVO vo) {
		System.out.println(vo.getBook_num());
		System.out.println(vo.getName());
		System.out.println(vo.getContent());
		System.out.println(vo.getTitle());
		service.write(vo);
		return "redirect:/book/getBookList";
	}
	
	//게시글보기
	@RequestMapping(value = "getBookList", method = RequestMethod.GET)
	public String getBookList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam(value="searchKeyword", defaultValue="") String searchKeyword,
			String searchCondition,
			Map<String, String> map, Model model) {
		
		PageNavigator navi = service.getNavi(currentPage, map);
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		
		model.addAttribute("getBookList", service.getBookList(map, navi));
		model.addAttribute("navi", navi);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		return "/book/getBookList";
	}
	
	//게시글 읽기
	@RequestMapping(value = "read")
	public String read(int book_num, Model model) {
		model.addAttribute("bookVO", service.read(book_num));
		return "/book/bookRead";
	}
	
	// 게시글 삭제
		@RequestMapping(value = "delete", method = RequestMethod.GET)
		public String delete(int book_num, RedirectAttributes rttr) {
			rttr.addFlashAttribute("result", service.delete(book_num));
			return "redirect:/book/getBookList";
		}
	
	// 게시글 수정 양식 이동
		@RequestMapping(value = "bookUpdateForm", method = RequestMethod.GET)
		public String updateForm(int book_num, Model model) {
			model.addAttribute("vo", service.read(book_num));
			return "/book/bookUpdateForm";
		}
		
	// 게시글 수정
		@RequestMapping(value = "update", method = RequestMethod.POST)
		public String update(BookVO vo, Model model) {
			model.addAttribute("book_num", vo.getBook_num());
			model.addAttribute("result", service.update(vo));
			return "/book/bookRead";
		}
}