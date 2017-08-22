package com.spring.manage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.BookDAO;
import com.spring.manage.vo.BookVO;


@Service
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDAO dao;

	@Override
	public int insert(BookVO vo) {
		return dao.insert(vo);
	} 
}