package com.spring.manage.dao;

import java.util.List;
import java.util.Map;

import com.spring.manage.vo.LendVO;



public interface AdminDAO {
	public List<LendVO> getStatusList(Map<String,String> map);
	public int lendBook(Map<String, Integer> map);
	public int rejectBook(int num);
	public int returnBook(int num);
	public int updateDelayed();
	public int returnDelayedBook(int num);
}
