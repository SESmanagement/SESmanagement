package com.spring.manage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.ArrangeService;
import com.spring.manage.vo.LendVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.ClassRoomVO;

import sun.awt.ModalExclude;




@Controller
@RequestMapping("/arrange")
public class ArrangController {
	
	@Autowired
	private ArrangeService service;

	//강의실로 이동
	@RequestMapping(value="/arrangeForm", method=RequestMethod.GET)
	public String arrangeForm(){
			
		return "/arrange/arrangeForm";
	}
	
	//강의실 목록 받아온다.
	@RequestMapping(value = "/getClassRoom", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ClassRoomVO> getClassRoom(ArrayList<ClassRoomVO> classRoom) {
		//강의실 리스트 받아온다. -> 모델에 추가합니다 하하하하 미치기 일보 직전 시작하자마자 어렵다아아아아아
		classRoom = service.getClassRoom();		
		return classRoom;
	}
	
	//기수 목록 받아온다.
	@RequestMapping(value = "/getPartyList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<PartyVO> getPartyList(ArrayList<PartyVO> party){
		party = service.getPartyList();
//		for(PartyVO vo : party){
//			System.out.println(vo);
//		}
		return party;
	}
	
	//강의실 업데이트
	@RequestMapping(value="/updateRoom", method=RequestMethod.POST)
	public String updateRoom(ClassRoomVO room, String[] seat){
		ArrayList<Room_StatusVO> statusList = new ArrayList<>();
		/*String[] seat = (String[]) session.getAttribute("seat");
		for(int i = 0 ; i < seat.length ; i++){
			System.out.println(seat);
		}*/
		
		System.out.println(room);
		System.out.println(seat);
		service.updateRoom(room, statusList);
		return "/arrange/arrangeForm";
	}

}