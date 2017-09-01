package com.spring.manage.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.BookDAO;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.BookVO;


@Service
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDAO dao;
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;
	
	@Override
	public ArrayList<BookVO> getBookList(Map<String, String> map, PageNavigator navi) {
		return dao.getBookList(map, navi.getStartRecord(), navi.getCountPerPage());
	}

	@Override
	public PageNavigator getNavi(int currentPage, Map<String, String> map) {
		int totalRecordsCount = dao.getTotal(map);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		return navi;
	}

	@Override
	public boolean write(BookVO vo) {
		if (dao.write(vo) == 1) return true;
		else return false;
	}

	@Override
	public BookVO read(int book_num) {
		return dao.read(book_num);
	}

	@Override
	public Object delete(int book_num) {
		if(dao.delete(book_num) != 1) return false;
		return true;
	}

	@Override
	public boolean update(BookVO vo) {
			if(dao.update(vo) != 1) {
				return false;
			}
			return true;
	}
}