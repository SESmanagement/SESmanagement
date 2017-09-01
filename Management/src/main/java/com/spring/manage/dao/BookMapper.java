package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.vo.BookVO;


public interface BookMapper {
	public ArrayList<BookVO> getBookList(Map<String, String> map, RowBounds rb);
	public int getTotal(Map<String, String> map);
	public int write(BookVO vo);
	public BookVO read(int book_num);
	public int delete(int book_num);
	public int update(BookVO vo);
}
