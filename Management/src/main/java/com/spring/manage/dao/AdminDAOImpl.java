package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;


public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<LendVO> getStatusList(Map<String, String> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.getStatusList(map);
	}

	@Override
	public int lendBook(Map<String, Integer> map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.lendBook(map);
	}

	@Override
	public int rejectBook(int num) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.rejectBook(num);
	}

	@Override
	public int returnBook(int num) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.returnBook(num);
	}

	@Override
	public int updateDelayed() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateDelayed();
	}

	@Override
	public int returnDelayedBook(int num) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.returnDelayedBook(num);
	}
}
