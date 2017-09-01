package com.spring.manage.dao;

import java.util.ArrayList;

import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

public interface GroupDAO {
	
	public int seek(GroupVO vo);
	public ArrayList<GroupVO> list();
	public ArrayList<GroupVO> detail(int group_num);
	public int join(GroupJoinVO vo);

}
