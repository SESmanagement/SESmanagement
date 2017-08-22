package com.spring.manage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.StudyRoomDAO;
import com.spring.manage.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService {

	@Autowired
	private StudyRoomDAO dao;

	@Override
	public ArrayList<StudyRoomVO> showInside(int studyroom_num) {
		return dao.showInside(studyroom_num);
	}
	
}
