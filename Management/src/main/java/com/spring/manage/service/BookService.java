package com.spring.manage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;

public interface BookService {
	public BookVO selectOne(int num);
	public int insert(BookVO vo);
	public int reserveBook(Map<String, Object> map);
	public List<LendVO> borrowList(String usernum, RowBounds rb);
	public int getBorrowCount(String usernum);
	public List<BookVO> selectAll(String searchType, String searchValue, int startRecord, int countPerPage);
	int getBookCount(String searchType, String searchValue);
}
