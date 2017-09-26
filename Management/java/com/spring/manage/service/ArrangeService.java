package com.spring.manage.service;

import java.util.List;
import java.util.Map;

import com.spring.manage.vo.LendVO;

public interface AdminService {
	public List<LendVO> getStatusList(String status, String searchType, String searchValue);
	public int lendBook(Map<String, Integer> map);
	public int rejectBook(int num);
	public int returnBook(int num);
	public int updateDelayed();
	public int returnDelayedBook(int num);
	
}
