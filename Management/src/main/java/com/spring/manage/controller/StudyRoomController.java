package com.spring.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	
	@RequestMapping(value = "rooms", method = RequestMethod.GET)
	public String rooms() {
		System.out.println("여기로 옵니까 안옵니까");
		return "rooms";
	}
}
