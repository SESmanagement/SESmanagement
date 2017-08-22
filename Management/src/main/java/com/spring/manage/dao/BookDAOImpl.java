package com.spring.manage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.BookVO;


@Repository
public class BookDAOImpl implements BookDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(BookVO vo) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.insert(vo);
	}
}
