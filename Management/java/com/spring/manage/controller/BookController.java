package com.spring.manage.controller;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.dao.AdminDAOImpl;
import com.spring.manage.dao.BookDAOImpl;
import com.spring.manage.util.FileService;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.util.PageNavigator2;
import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;
import com.spring.manage.vo.MemberVO;

@Controller
public class BookController {
		
	@Autowired
	BookDAOImpl repo;
	
	@Autowired
	AdminDAOImpl repoA;
	
	String uploadPath = "/img";
	
	//책 목록
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public String bookList(
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
		
		int totalRecordCount = repo.getBookCount(searchType, searchValue);
		System.out.println("===========>"+totalRecordCount);
		PageNavigator2 navi=new PageNavigator2(showNum, currentPage, totalRecordCount);
		List<BookVO> list = repo.selectAll(searchType, searchValue, navi.getStartRecord(), navi.getCountPerPage());
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
		return "book/bookList";
	}

	//책 자세히 보기
	@RequestMapping(value = "/bookDetail", method = RequestMethod.GET)
	public String bookDetail(int num, 
			@RequestParam(value="searchType", defaultValue="title") String searchType,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="showNum", defaultValue="3") int showNum,
			Model model) {
		BookVO b = repo.selectOne(num);
		String originalSearchValue=searchValue;
		if(searchType.equals("status")){
			if(searchValue.equals("y") || searchValue.equals("Y")) searchValue="Yes";
			if(searchValue.equals("n") || searchValue.equals("N")) searchValue="Nope";
		}
		if (b.getStatus() == null || b.getStatus().equals("returned") || b.getStatus().equals("rejected")
				|| b.getStatus().equals("delay_returned")) {
			b.setStatus("Y");
		} else {
			b.setStatus("N");
		}
		model.addAttribute("book", b);
		model.addAttribute("showNum", showNum);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue",originalSearchValue);
		return "book/bookDetail";
	}

	//대출 신청
	@RequestMapping(value = "/borrowApply", method = RequestMethod.GET)
	public @ResponseBody String borrowApply(int booknum, String mem_num, LendVO lendVO) {
		Map<String, Object> map = new HashMap<>();
		
		// mem_num을 LendVO에 담아서 보낸다. 20170928 수정
		lendVO.setMem_num(mem_num);
		lendVO.setBooknum(booknum);
		int result = repo.reserveBook(lendVO);
		
//		map.put("booknum", booknum);
//		map.put("mem_num", mem_num);
//		int result = repo.reserveBook(map);

		if (result > 0) {
			return "정상적으로 신청되었습니다";
		}
		return "대출신청이 실패하였습니다.";
	}
	
	
	//대출이력으로 이동
	@RequestMapping(value = "/borrowList", method = RequestMethod.GET)
	public String borrowList(
			HttpSession session, Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage
	) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		int member_num = member.getStudent_num();
		
		int totalRecordCount = repo.getBorrowCount(member_num);
		PageNavigator2 navi=new PageNavigator2(10, currentPage, totalRecordCount);
		repoA.updateDelayed();
		List<LendVO> borrowlist=repo.borrowList(navi.getStartRecord(), navi.getCountPerPage(), member_num);
		for(LendVO l  : borrowlist){
			switch(l.getStatus()){
				case "reserved" : 
					l.setStatus("대출신청중");
					break;
				case "lent" : 
					l.setStatus("대출중");
					break;
				case "returned" : 
					l.setStatus("반납완료");
					break;
				case "rejected" : 
					l.setStatus("대출거절");
					break;
				case "delayed" : 
					l.setStatus("연체");
					break;
				case "delay_returned" :
					l.setStatus("연체반납");
					break;
			}
		}
		model.addAttribute("borrowlist", borrowlist);
		model.addAttribute("navi", navi);
		return "book/borrowList";
	}
	
	// 이미지 띄우기
	@RequestMapping(value = "/downloadBook", method = RequestMethod.GET)
	public void downloadBook(int num, HttpServletResponse response) {
		String fullPath = uploadPath + "/" + repo.selectOne(num).getImageurl();

		FileInputStream filein = null;
		ServletOutputStream sout = null;

		try {
			filein = new FileInputStream(fullPath);
			sout = response.getOutputStream();

			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	//--------------


	// 책 등록 창으로 가기
	@RequestMapping(value = "/registBook", method = RequestMethod.GET)
	public String registBook() {
		return "admin/registBook";
	}
	
	
	// 책 등록하기
	@RequestMapping(value = "/registBook", method = RequestMethod.POST)
	public String registBook(BookVO book, MultipartFile upload) {
		// 책 이미지 저장
		if (upload.getOriginalFilename().length() > 0) {
			String savedImage = FileService.saveFile(uploadPath, upload, book.getTitle() + "_" + book.getAuthor());
			book.setImageurl(savedImage);
		}
		// DB에 저장
		repo.insert(book);
		return "book/bookList";
	}		
}
