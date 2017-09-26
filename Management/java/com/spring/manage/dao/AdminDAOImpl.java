package com.spring.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.LendVO;

@Repository
public class AdminDAOImpl {

	@Autowired
	SqlSession sqlSession;
	
	public List<LendVO> getStatusList(String status, String searchType, String searchValue){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		Map<String, String> map=new HashMap<>();
		map.put("status", status);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getStatusList(map);
	}
	
	public int lendBook(Map<String, Integer> map){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.lendBook(map);
	}
	
	public int rejectBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.rejectBook(num);
	}
	
	public int returnBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.returnBook(num);
	}
	
	public int updateDelayed(){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.updateDelayed();
	}
	
	public int returnDelayedBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.returnDelayedBook(num);
	}
}
