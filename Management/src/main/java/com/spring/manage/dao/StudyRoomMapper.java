package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.StudyRoomVO;

public interface StudyRoomMapper {

	// ���콺 ������ �ش� ���͵��(studyroom_num) ������Ȳ �˾�â ����
	public ArrayList<StudyRoomVO> showInside(int studyroom_num);

}
