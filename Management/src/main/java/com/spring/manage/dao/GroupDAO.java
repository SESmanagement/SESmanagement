package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;
import com.spring.manage.vo.MyGroupVO;

public interface GroupDAO {
	
	public int seek(GroupVO vo);
	public ArrayList<GroupVO> list(Map<String, String> map, int startRecord, int countPerPage);
	public int join(GroupJoinVO vo);
	public int total_count(Map<String, String> map);
	public GroupVO paging(PageNavigator navi);
	public int member_count(int group_num);
	public ArrayList<GroupVO> mygroup(GroupJoinVO vo);
	public ArrayList<GroupVO> team(GroupJoinVO vo);
	public ArrayList<GroupJoinVO> include();
	public ArrayList<GroupVO> daredoko(GroupJoinVO gjvo);
	public GroupVO detail(GroupJoinVO gjvo);
	public int penalty(GroupJoinVO gjvo);
	public ArrayList<GroupVO> grouppen();
	public int insert_penalty(GroupJoinVO gjvo);
	public int modify_penalty(GroupJoinVO gjvo);
	public ArrayList<GroupJoinVO> penalty_list(GroupJoinVO gjvo);

}



