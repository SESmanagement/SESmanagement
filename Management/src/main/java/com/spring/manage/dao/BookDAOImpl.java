package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.BookVO;

@Repository
public class BookDAOImpl implements BookDAO{

	@Autowired
	private SqlSession sqlSession;

	//게시글 목록 가져오기
	@Override
	public ArrayList<BookVO> getBookList(Map<String, String> map, int startRecord, int countPerPage) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		return mapper.getBookList(map, rb);
	}

	@Override
	public int getTotal(Map<String, String> map) {
		return 0;
	}

	@Override
	public int write(BookVO vo) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.write(vo);
	}

	@Override
	public BookVO read(int book_num) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.read(book_num);	
	}

	@Override
	public int delete(int book_num) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.delete(book_num);
	}

	@Override
	public int update(BookVO vo) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.update(vo);
	}
}
