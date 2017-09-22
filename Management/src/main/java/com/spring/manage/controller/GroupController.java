package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.GroupServiceImpl;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupServiceImpl service;

	// 참여중인 소모임 화면이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword, String searchCondition,
			Map<String, String> map, Model model) {
		PageNavigator navi = service.getNavi(currentPage, map);
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		model.addAttribute("list", service.list(map, navi));
		model.addAttribute("navi", navi);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		return "group/group";
	}

	// 소모임 모집하기로 화면이동
	@RequestMapping(value = "seek", method = RequestMethod.GET)
	public String seek() {
		return "group/group_seek";
	}

	// 소모임 모집하기 form 실행
	@RequestMapping(value = "group_seek", method = RequestMethod.POST)
	public String seek(GroupVO vo) {
		if (service.seek(vo)) { // true면
			return "redirect:/group/list";
		} else
			return "group/group_seek";
	}

	// 소모임 세부화면 화면이동
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(GroupJoinVO gjvo, Model model) {
		model.addAttribute("gvolist", service.daredoko(gjvo)); // 해당 그룹에 누구누구
																// 가입했는지
		System.out.println("세부화면"+service.detail(gjvo));
		model.addAttribute("detail", service.detail(gjvo));
		return "group/group_detail";
	}

	// 나의 소모임
	@RequestMapping(value = "mygroup", method = RequestMethod.GET)
	public String mygroup(GroupJoinVO vo, Model model) {
		// 각 스터디에 있는 사람들 이름이랑 정보 빼와야함(GroupJoinVO)
		System.out.println("mygroup의 vo : " + vo);
		ArrayList<GroupVO> myvo = service.mygroup(vo);
		model.addAttribute("myvolist", myvo); // 내가 만든 소모임 정보
		ArrayList<GroupVO> gvo = service.team(vo); // 다른 사람이 만들고 내가 가입한 소모임 정보
		model.addAttribute("gvolist", gvo);
		ArrayList<GroupJoinVO> gjvo = service.include(); // 소속 팀원 정보 가져오기
		model.addAttribute("gjvolist", gjvo);
		ArrayList<GroupVO> pgvo = service.grouppen();
		model.addAttribute("pgvolist", pgvo);
		return "group/my_group";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	@ResponseBody
	public int join(GroupJoinVO vo2, int headcount) {
		if (service.member_count(vo2.getGroup_num()) == headcount) {
			return 1; // 만원
		} else if (service.join(vo2) == false) {
			return 2; // 이미 가입
		} else {
			return 3; // 가입성공
		}
	}

	@RequestMapping(value = "penalty", method = RequestMethod.POST)
	@ResponseBody
	public int penalty(GroupJoinVO gjvo) {
		return service.penalty(gjvo);
	}

	@RequestMapping(value = "insert_penalty", method = RequestMethod.POST)
	@ResponseBody
	public boolean insert_penalty(GroupJoinVO gjvo) {
		if(service.insert_penalty(gjvo)>0){ 
			return true;
		}else return false;
	}
	
	@RequestMapping(value = "modify_penalty", method = RequestMethod.POST)
	@ResponseBody
	public boolean modify_penalty(GroupJoinVO gjvo) {
		if(service.modify_penalty(gjvo)>0){ 
			return true;
		}else return false;
	}
	
	
	

	// 페널티 적립내역, 사용내역 history
	@RequestMapping(value = "penalty_list", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<GroupJoinVO> penalty_list(GroupJoinVO gjvo) {
		System.out.println(gjvo);
		System.out.println(service.penalty_list(gjvo));
		return service.penalty_list(gjvo);
	}

	@RequestMapping(value = "calendar", method = RequestMethod.POST)
	@ResponseBody
	public int calendar(GroupJoinVO gjvo) {
		gjvo.getStudent_num();
		return 1004;
	}

}