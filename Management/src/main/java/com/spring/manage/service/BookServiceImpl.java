package com.spring.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.BookDAO;
import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;


@Service
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDAO dao;

	@Override
	public BookVO selectOne(int num) {
		return dao.selectOne(num);
	}

	@Override
	public int insert(BookVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int reserveBook(Map<String, Object> map) {
		return dao.reserveBook(map);
	}

	@Override
	public List<LendVO> borrowList(String usernum, RowBounds rb) {
		return dao.borrowList(usernum, rb);
	}

	@Override
	public int getBookCount(String searchType, String searchValue) {
		Map<String,String> map=new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getBookCount(map);
	}

	@Override
	public int getBorrowCount(String usernum) {
		return dao.getBorrowCount(usernum);
	}

	@Override
	public List<BookVO> selectAll(String searchType, String searchValue, int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String, String> search = new HashMap<>();
		search.put("searchType", searchType);
		search.put("searchValue", searchValue);
		return dao.selectAll(search, rb);
	}
}