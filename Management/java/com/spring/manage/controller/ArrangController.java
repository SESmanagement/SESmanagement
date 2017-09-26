package com.spring.manage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.ArrangeService;
import com.spring.manage.vo.ArrangeVO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;




@Controller
@RequestMapping("/arrange")
public class ArrangeController {
	
	@Autowired
	private ArrangeService service;

	//媛뺤쓽?ㅻ줈 ?대룞
	@RequestMapping(value="/arrangeForm", method=RequestMethod.GET)
	public String arrangeForm(){
			
		return "/arrange/arrangeForm";
	}
	
	//媛뺤쓽??紐⑸줉 諛쏆븘?⑤떎.
	@RequestMapping(value = "/getClassRoom", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ClassRoomVO> getClassRoom(ArrayList<ClassRoomVO> classRoom) {
		//媛뺤쓽??由ъ뒪??諛쏆븘?⑤떎. -> 紐⑤뜽??異붽??⑸땲???섑븯?섑븯 誘몄튂湲??쇰낫 吏곸쟾 ?쒖옉?섏옄留덉옄 ?대졄?ㅼ븘?꾩븘?꾩븘
		classRoom = service.getClassRoom();		
		return classRoom;
	}
	
	//湲곗닔 紐⑸줉 諛쏆븘?⑤떎.
	@RequestMapping(value = "/getPartyList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<PartyVO> getPartyList(ArrayList<PartyVO> party){
		party = service.getPartyList();
		return party;
	}
	
	//媛뺤쓽???낅뜲?댄듃
	@RequestMapping(value="/updateRoom", method=RequestMethod.POST)
	public String updateRoom(ClassRoomVO room){
		ArrayList<Room_StatusVO> statusList = new ArrayList<>();

		service.updateRoom(room);
		return "/arrange/arrangeForm";
	} 
	
	//媛뺤쓽???곹깭 ?꾩껜 ?몄텧	
	@RequestMapping(value="/getRoom_Status", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<Room_StatusVO> getRoom_Status(int classRoom_num){
		return service.getRoom_Status(classRoom_num);
	} 
	
	//public ClassRoomVO selectRoom(int num)
	//媛뺤쓽??踰덊샇瑜??듯빐 媛뺤쓽??VO ?몄텧
	@RequestMapping(value="/selectRoom", method=RequestMethod.GET)
	@ResponseBody
	public ClassRoomVO selectRoom(int num){
		return service.selectRoom(num);
	} 
	
	//ServiceAble 泥댁씤吏
	//蹂寃쏀빐二쇨퀬 room_statusvo 由ъ뒪?몃줈 諛섑솚?쒕떎.
	@RequestMapping(value="/changeServiceAble", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Room_StatusVO> changeServiceAble(Room_StatusVO status){
		System.out.println(status.getServiceable());
		
		ArrayList<Room_StatusVO> statusList = service.changeServiceAble(status);
		
		return statusList;
	} 
	
	
	//방배치 이동
	@RequestMapping(value="/arrangeMemberForm", method=RequestMethod.GET)
	public String arrangeMemberForm(){
		return "/arrange/arrangeMemberForm";
	}
	
	
	//public ClassRoomVO selectRoom(int num)
	//媛뺤쓽??踰덊샇瑜??듯빐 媛뺤쓽??VO ?몄텧
	@RequestMapping(value="/callRooms", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<ClassRoomVO> callRooms(int party_num){
		return service.callRooms(party_num);
	} 
	
	//public int countPartyMember(int party_num)
	@RequestMapping(value="/countPartyMember", method=RequestMethod.GET)
	@ResponseBody
	public Integer countPartyMember(int party_num){
		int value = service.countPartyMember(party_num);
		System.out.println(value);
		return value;
	} 
	
	
	//public ArrayList<MemberVO> readyMember(int party_num);
	@RequestMapping(value="/readyMember", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<ArrangeVO> ArrangeClass(int party_num){
		return service.ArrangeClass(party_num);
	} 
	
}
