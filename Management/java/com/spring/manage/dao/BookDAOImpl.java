package com.spring.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;


@Repository
public class BookDAOImpl{

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(BookVO book){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		return dao.insert(book);
	}
	
	public BookVO selectOne(int num){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		return dao.selectOne(num);
	}
	
	public List<BookVO> selectAll(String searchType, String searchValue, int startRecord, int countPerPage){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		RowBounds rb=new RowBounds(startRecord, countPerPage);
		Map<String, String> search=new HashMap<>();
		search.put("searchType", searchType);
		search.put("searchValue", searchValue);
		return dao.selectAll(search, rb);
	}
	
	public int reserveBook(Map<String, Object> map){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		return dao.reserveBook(map);
	}
	
	public List<LendVO> borrowList(int startRecord, int countPerPage, int member_num){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		RowBounds rb=new RowBounds(startRecord, countPerPage);
		return dao.borrowList(member_num, rb);
	}
	
	public int getBookCount(String searchType, String searchValue){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		Map<String,String> map=new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getBookCount(map);
	}
	
	public int getBorrowCount(int member_num){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		return dao.getBorrowCount(member_num);
	}
}
