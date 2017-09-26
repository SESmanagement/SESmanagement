package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.manage.vo.BookVO;
import com.spring.manage.vo.LendVO;


public interface BookMapper {
	public int delete(int num);
	public int update(BookVO vo);
}
