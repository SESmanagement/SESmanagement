package com.spring.manage.dao;

import java.util.List;
import java.util.Map;

import com.spring.manage.vo.LendVO;

public interface AdminDAO {
	public List<LendVO> getStatusList(Map<String,String> map);
	public int lendBook(Map<String, Integer> map);
	public int rejectBook(int num);
	public int returnBook(int num);
	public int updateDelayed();
	public int returnDelayedBook(int num);
	
	// 캘린더: 도서대여승인시 이벤트 테이블 상태변경 (대여요청->대여중, 요청일자->반납예정일자)
	public void modifyLendEvent(Map<String, Integer> map);
	// 캘린더: 도서대여승인 반려시 이벤트 테이블에서 삭제
	public void deleteLendEvent(int num);
	// 캘린더: 도서반납시 이벤트 테이블에서 상태 변경 (대여중->반납완료, 반납예정일자->반납완료일자)
	public void endLendEvent(int num);
	// 도서 연체 리스트 가져오기
	public ArrayList<LendVO> getDelayedList();
	// 캘린더: 도서연체시 이벤트 테이블에서 상태 변경(대여중->연체중, 반납예정일자->오늘)
	public void delayedLendEvent(LendVO delayedList);
}
