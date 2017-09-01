package com.spring.manage.service;

import java.util.ArrayList;

import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

public interface GroupService {
	
	public boolean seek(GroupVO vo);
	public ArrayList<GroupVO> list();
	public ArrayList<GroupVO> detail(int group_num);
	public boolean join(GroupJoinVO vo2);

}
