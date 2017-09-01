package com.spring.manage.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int seek(GroupVO vo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.seek(vo);
	}
	
	@Override
	public ArrayList<GroupVO> list() {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.list();
	}


	@Override
	public ArrayList<GroupVO> detail(int group_num) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		System.out.println("dao"+mapper.detail(group_num));
		return mapper.detail(group_num);
	}
	
	@Override
	public int join(GroupJoinVO vo){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		if(mapper.join_mae(vo) == null) return mapper.join(vo);
		else return 0;
	}
	
}
