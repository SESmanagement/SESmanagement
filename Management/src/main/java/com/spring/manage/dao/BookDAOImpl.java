package com.spring.manage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOImpl implements BookDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert() {
		
		return 0;
	}

}
