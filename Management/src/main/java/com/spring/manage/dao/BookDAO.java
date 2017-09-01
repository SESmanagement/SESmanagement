package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.spring.manage.vo.BookVO;


public interface BookDAO {
	public ArrayList<BookVO> getBookList(Map<String, String> map, int startRecord, int countPerPage);
	public int getTotal(Map<String, String> map);
	public int write(BookVO vo);
	public BookVO read(int book_num);
	public int delete(int book_num);	
	public int update(BookVO vo);
}
