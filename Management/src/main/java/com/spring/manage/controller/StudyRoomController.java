package com.spring.manage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.manage.service.StudyRoomService;
import com.spring.manage.vo.StudyRoomVO;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;
	
	// top¸Ş´º ->½ºÅÍµğ·ë ÇöÈ²Á¶È¸(top-½ºÅÍµğ·ë ¿¹¾à-¸Ş´º Æ÷ÇÔ)·Î ÀÌµ¿
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms() {
<<<<<<< HEAD
		return "studyroom/rooms";
=======
		System.out.println("ì—¬ê¸°ë¡œ ì˜µë‹ˆê¹Œ ì•ˆì˜µë‹ˆê¹Œ");
		return "rooms";
>>>>>>> branch 'master' of https://github.com/SESmanagement/SESmanagement.git
	}
	
	// ¸¶¿ì½º ¿À¹ö½Ã ÇØ´ç ½ºÅÍµğ·ë(studyroom_num) ¿¹¾àÇöÈ² ÅøÆÁ ¶ç¿ì±â
	@RequestMapping(value = "showInside", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<StudyRoomVO> showInside(int studyroom_num, ArrayList<StudyRoomVO> srList) {
		srList = service.showInside(studyroom_num);
		return srList;
	}
	
	// ¸¶¿ì½º Å¬¸¯½Ã ÇØ´ç ½ºÅÍµğ·ë(studyroom_num) ¿¹¾àÆû ÆäÀÌÁö·Î ÀÌµ¿
	@RequestMapping(value = "reserveRoomForm", method = RequestMethod.GET)
	public String reserveRoomForm(int studyroom_num, ArrayList<StudyRoomVO> srList, Model model) {
		srList = service.showInside(studyroom_num);
		model.addAttribute(srList);
		return "studyroom/reserveRoomForm";
	}
	
	
	
}
