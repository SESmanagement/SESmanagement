package com.spring.manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;


public interface BookDAO {
	public BookVO selectOne(int num);
	public int insert(BookVO vo);
	public int reserveBook(Map<String, Object> map);
	public List<LendVO> borrowList(String usernum, RowBounds rb);
	public int getBookCount(Map<String, String> map);
	public int getBorrowCount(String usernum);
	public List<BookVO> selectAll(Map<String, String> search, RowBounds rb);
	
}
