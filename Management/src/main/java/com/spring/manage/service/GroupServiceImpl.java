package com.spring.manage.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.GroupDAOImpl;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.util.PageNavigator2;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAOImpl dao;
	private final int countPerPage = 9;
	private final int pagePerGroup = 10;
	
	@Override
	public boolean seek(GroupVO vo) {
		System.out.println("서비스"+vo);
		if( dao.seek(vo) > 0){	//insert가 업데이트 되서 결과가 1 이상
			GroupJoinVO vo2 = new GroupJoinVO(vo.getGroup_num(), vo.getStudent_num(), 0, null, null);
			if(dao.join(vo2)>0) return true;
			else return false;
		}else{				//insert 업데이트 못되서 결과가 0
			return false;
		}
	}
	
	@Override
	public ArrayList<GroupVO> list(Map<String, String> map, PageNavigator navi){
		return dao.list(map, navi.getStartRecord(), navi.getCountPerPage());
	}

	
	@Override
	public int member_count(int group_num){
		return dao.member_count(group_num);
	}
	
	
	@Override
	public PageNavigator getNavi(int currentPage, Map<String, String> map) {
		int totalRecordsCount = dao.total_count(map);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		return navi;
	}

	
	@Override
	public ArrayList<GroupVO> daredoko(GroupJoinVO gjvo){
		return dao.daredoko(gjvo);
	}
	
	@Override
	public GroupVO detail(GroupJoinVO gjvo) {
		return dao.detail(gjvo);
	}

	@Override
	public boolean join(GroupJoinVO vo2) {
		if(dao.join(vo2)>0){
			return true;
		}
		else return false;
	}

	@Override
	public ArrayList<GroupVO> mygroup(GroupJoinVO vo){
		return dao.mygroup(vo);
	}

	@Override
	public ArrayList<GroupVO> team(GroupJoinVO vo){
		return dao.team(vo);
	}

	@Override
	public ArrayList<GroupJoinVO> include() {
		return dao.include();
	}

	@Override
	public int penalty(GroupJoinVO gjvo) {
		return dao.penalty(gjvo);
	}
	
	@Override
	public ArrayList<GroupVO> grouppen(){
		return dao.grouppen();
		}

	@Override
	public int insert_penalty(GroupJoinVO gjvo) {
		return dao.insert_penalty(gjvo);
	}

	
	@Override
	public int modify_penalty(GroupJoinVO gjvo) {
		return dao.modify_penalty(gjvo);
	}

	@Override
	public ArrayList<GroupJoinVO> penalty_list(GroupJoinVO gjvo) {
		return dao.penalty_list(gjvo);
	}



}
