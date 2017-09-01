package com.spring.manage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.GroupDAOImpl;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAOImpl dao;
	
	@Override
	public boolean seek(GroupVO vo) {
		if(dao.seek(vo)<1){	//insert가 업데이트 되지 못해 결과가 0
			return false;
		}else{				//insert 업데이트 되서 결과가 1 이상
			return true;
		}
	}
	
	@Override
	public ArrayList<GroupVO> list(){
		return dao.list();
	}

	@Override
	public ArrayList<GroupVO> detail(int group_num) {
		System.out.println("서비스"+dao.detail(group_num));
		return dao.detail(group_num);
	}

	@Override
	public boolean join(GroupJoinVO vo2) {
		if(dao.join(vo2)>0) return true;
		else return false;
	
	}

}
