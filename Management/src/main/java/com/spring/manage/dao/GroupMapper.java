package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.util.PageNavigator2;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

public interface GroupMapper {

	public int seek(GroupVO vo);
	public ArrayList<GroupVO> list(Map<String, String> map, RowBounds rb);
	public GroupVO detail(GroupJoinVO gjvo);
	public GroupJoinVO join_mae(GroupJoinVO joinVO);
	public int join(GroupJoinVO joinVo);
	public int total_count(Map<String, String> map);
	public GroupVO paging(PageNavigator2 navi);
	public int member_count(int group_num);
	public ArrayList<GroupVO> mygroup(GroupJoinVO vo);
	public ArrayList<GroupVO> team(GroupJoinVO vo);
	public ArrayList<GroupJoinVO> include();
	public ArrayList<GroupVO> daredoko(GroupJoinVO gjvo);
	public Integer penalty(GroupJoinVO gjvo);
	public ArrayList<GroupVO> grouppen();
	public int insert_penalty(GroupJoinVO gjvo);
	public ArrayList<GroupJoinVO> penalty_list(GroupJoinVO gjvo);
	public int modify_penalty(GroupJoinVO gjvo);
}
