package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomService {

	// ���콺 ������ �ش� ���͵��(studyroom_num) ������Ȳ �˾�â ����
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);

}
