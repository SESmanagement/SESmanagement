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
	
	public int reserveBook(LendVO lendVO){ // // Map-> LendVO로 타입 수정 - 20170928
	      BookDAO dao=sqlSession.getMapper(BookDAO.class);
	      int result = dao.reserveBook(lendVO);
	      lendVO.setStartdate(new SimpleDateFormat("yy/MM/dd").format(new Date())); // 대여요청일자(오늘)
	      lendVO.setTitle(dao.getBookTitle(lendVO)); // 책 제목
	      dao.addEvent(lendVO);
	      return result;
	   }
	
	public List<LendVO> borrowList(int startRecord, int countPerPage, String mem_num){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		RowBounds rb=new RowBounds(startRecord, countPerPage);
		return dao.borrowList(mem_num, rb);
	}
	
	public int getBookCount(String searchType, String searchValue){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		Map<String,String> map=new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getBookCount(map);
	}
	
	public int getBorrowCount(String mem_num){
		BookDAO dao=sqlSession.getMapper(BookDAO.class);
		return dao.getBorrowCount(mem_num);
	}
}
