package com.spring.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.dao.AdminDAOImpl;
import com.spring.manage.vo.LendVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminDAOImpl repo;
	
	//대출 신청 목록으로 이동
	@RequestMapping(value="/applyList", method=RequestMethod.GET)
	public String applyList(HttpSession session, Model model){
			return "admin/applyList";
	}
	
	//대출 신청 목록 불려오기
	@RequestMapping(value="/appliedList", method=RequestMethod.GET)
	public @ResponseBody List<LendVO> appliedList(
			@RequestParam(value="adminSearchType", defaultValue="title") String adminSearchType,
			@RequestParam(value="adminSearchValue", defaultValue="") String adminSearchValue
	){
		return repo.getStatusList("reserved", adminSearchType, adminSearchValue);
	}
	
	//대출 신청 목록 : 대출 승인
	@RequestMapping(value="/lendBook", produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public @ResponseBody String lendBook(int num, int daysOfLend){
		Map<String, Integer> map=new HashMap<>();
		map.put("num", num);
		map.put("daysOfLend", daysOfLend);
		if(repo.lendBook(map)>0){
			return "대출승인 되었습니다";
		}
		return "대출 승인에 실패하였습니다";
	}
	
	//대출 신청 목록 : 대출 반려
	@RequestMapping(value="/rejectBook", produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public @ResponseBody String rejectBook(int num){
		if(repo.rejectBook(num)>0){
			return "대출반려 되었습니다";
		}
		return "대출 반려에 실패하였습니다";
	}
	
	//대출목록으로 이동
	@RequestMapping(value="/lendList", method=RequestMethod.GET)
	public String lendList(HttpSession session, Model model){
			return "admin/lendList";
	}
	
	//대출목록 불러오기
	@RequestMapping(value="/lentList", method=RequestMethod.GET)
	public @ResponseBody List<LendVO> lentList(
			@RequestParam(value="adminSearchType", defaultValue="title") String adminSearchType,
			@RequestParam(value="adminSearchValue", defaultValue="") String adminSearchValue
	){
		//연체인 경우 갱신
		repo.updateDelayed();
		return repo.getStatusList("lent", adminSearchType, adminSearchValue);
	}
	
	//대출목록 : 반납
	@RequestMapping(value="/returnBook", produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public @ResponseBody String returnBook(int num){
		if(repo.returnBook(num)>0){
			return "반납 되었습니다";
		}
		return "반납에 실패하였습니다";
	}
	
	//연체 목록으로 이동
	@RequestMapping(value="/delayList", method=RequestMethod.GET)
	public String delayList(HttpSession session, Model model){
			return "admin/delayList";
	}
	
	//연체 목록 보내기
	@RequestMapping(value="/delayedList", method=RequestMethod.GET)
	public @ResponseBody List<LendVO> delayedList(
			@RequestParam(value="adminSearchType", defaultValue="title") String adminSearchType,
			@RequestParam(value="adminSearchValue", defaultValue="") String adminSearchValue
	){
		return repo.getStatusList("delayed", adminSearchType, adminSearchValue);
	}
	
	//연체 도서 반납
	@RequestMapping(value="/returnDelayedBook", produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public @ResponseBody String returnDelayedBook(int num){
		if(repo.returnDelayedBook(num)>0){
			return "반납 되었습니다";
		}
		return "반납 실패하였습니다.";
	}
}
