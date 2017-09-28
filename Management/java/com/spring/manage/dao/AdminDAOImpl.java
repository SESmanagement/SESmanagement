package com.spring.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.LendVO;

@Repository
public class AdminDAOImpl {

	@Autowired
	SqlSession sqlSession;
	
	public List<LendVO> getStatusList(String status, String searchType, String searchValue){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		Map<String, String> map=new HashMap<>();
		map.put("status", status);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return dao.getStatusList(map);
	}
	
	public int lendBook(Map<String, Integer> map){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		int result = dao.lendBook(map);
		dao.modifyLendEvent(map);
		return result;
	}
	
	public int rejectBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		int result = dao.rejectBook(num);
		dao.deleteLendEvent(num);
		return result;
	}
	
	public int returnBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		int result = dao.returnBook(num);
		dao.endLendEvent(num);
		return result;
	}
	
	public int updateDelayed(){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		int result = dao.updateDelayed();
		// 연체 리스트 가져오기
		ArrayList<LendVO> delayedList = dao.getDelayedList(); 
		// 연체 리스트의 개별 대여건별로 이벤트 테이블 업데이트
		for (LendVO vo : delayedList) {
			dao.delayedLendEvent(vo);
		}
		return result;
	}
	
	public int returnDelayedBook(int num){
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		int result = dao.returnDelayedBook(num);
		dao.endLendEvent(num);
		return result;
	}
}
