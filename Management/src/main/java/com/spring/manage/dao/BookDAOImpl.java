package com.spring.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;

public class BookDAOImpl implements BookDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BookVO> selectAll(Map<String, String> search, RowBounds rb) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.selectAll(search, rb);
	}

	@Override
	public BookVO selectOne(int num) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.selectOne(num);
	}

	@Override
	public int insert(BookVO vo) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.insert(vo);
	}

	@Override
	public int reserveBook(Map<String, Object> map) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.reserveBook(map);
	}

	@Override
	public List<LendVO> borrowList(String usernum, RowBounds rb) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.borrowList(usernum, rb);
	}

	@Override
	public int getBookCount(Map<String, String> map) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.getBookCount(map);
	}

	@Override
	public int getBorrowCount(String usernum) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.getBorrowCount(usernum);
	}

}
