package com.spring.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.service.AdminService;
import com.spring.manage.service.BookService;
import com.spring.manage.util.FileService;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.BookVO;



@Controller
@RequestMapping("/book")
public class BookController {
//캐치유 캐치유 캐치미 캐치미 이제 숨바꼭질은 그만~ 우울한건 모두 파란하늘에 묻어버려~ 
	@Autowired
	private BookService b_service; //bookservice
	
	@Autowired
	private AdminService a_service; //adminservice
	
	final String uploadPath = "/booksImage";
	
	//책목록
	@RequestMapping(value = "/getBookList", method = RequestMethod.GET)
	public String getBookList(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
				@RequestParam(value="searchType", defaultValue="title") String searchType,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				@RequestParam(value="showNum", defaultValue="3") int showNum,
				Model model) {
		String originalSearchValue=searchValue;
		if(searchType.equals("status")){
			if(searchValue.equals("y") || searchValue.equals("Y")) searchValue="Yes";
			if(searchValue.equals("n") || searchValue.equals("N")) searchValue="Nope";
		}
		
		int totalRecordCount = b_service.getBookCount(searchType, searchValue);
		System.out.println("===========>"+totalRecordCount);
		PageNavigator navi=new PageNavigator(showNum, currentPage, totalRecordCount, totalRecordCount);
		List<BookVO> list = b_service.selectAll(searchType, searchValue, navi.getStartRecord(), navi.getCountPerPage());
		for (BookVO b : list) {
			if (b.getStatus() == null || b.getStatus().equals("returned") || b.getStatus().equals("rejected")
					|| b.getStatus().equals("delay_returned")) {
				b.setStatus("Y");
			} else {
				b.setStatus("N");
			}
		}
		if(list.size()<1){
			model.addAttribute("msg","해당 결과가 없습니다.");
		}
		System.out.println(list.size());
		model.addAttribute("showNum", showNum);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue",originalSearchValue);
		model.addAttribute("navi",navi);
		model.addAttribute("booklist", list);
		model.addAttribute("cnt", 1);
		return "home";
	}

	
	// 책 등록 Form
	@RequestMapping(value = "/registBookForm", method = RequestMethod.GET)
	public String registBook() {
		System.out.println("여긴들어온듯");
		return "/admin/registBookForm";
	}
	
	//책 등록
	@RequestMapping(value = "/registBook", method = RequestMethod.POST)
	public String registBook(BookVO vo, MultipartFile upload) {
		// 책 이미지 저장
		if (upload.getOriginalFilename().length() > 0) {
			String img_src = FileService.saveFile(uploadPath, upload, vo.getTitle() + "_" + vo.getAuthor());
			vo.setImg_src(img_src);
		}
		b_service.insert(vo);
		return "admin/lendList";
	}
	
	
}