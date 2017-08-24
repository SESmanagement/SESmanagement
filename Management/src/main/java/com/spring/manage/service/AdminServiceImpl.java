package com.spring.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.AdminDAO;
import com.spring.manage.vo.LendVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO dao;

	@Override
	public List<LendVO> getStatusList(String status, String searchType, String searchValue) {
		Map<String, String> map=new HashMap<>();
		map.put("status", status);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getStatusList(map);
	}

	@Override
	public int lendBook(Map<String, Integer> map) {
		return dao.lendBook(map);
	}

	@Override
	public int rejectBook(int num) {
		return dao.rejectBook(num);
	}

	@Override
	public int returnBook(int num) {
		return dao.rejectBook(num);
	}

	@Override
	public int updateDelayed() {
		return dao.updateDelayed();
	}

	@Override
	public int returnDelayedBook(int num) {
		return dao.returnDelayedBook(num);
	}
	
	
}
