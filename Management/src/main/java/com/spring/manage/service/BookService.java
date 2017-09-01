package com.spring.manage.service;

import java.util.ArrayList;
import java.util.Map;

import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.BookVO;

public interface BookService {
	public ArrayList<BookVO> getBookList(Map<String, String> map, PageNavigator navi);
	public PageNavigator getNavi(int currentPage, Map<String, String> map);
	public boolean write(BookVO vo);
	public BookVO read(int book_num);
	public Object delete(int book_num);
	public boolean update(BookVO vo);
}
