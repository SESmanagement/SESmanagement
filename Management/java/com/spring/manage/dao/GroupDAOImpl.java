package com.spring.manage.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.manage.util.PageNavigator2;
import com.spring.manage.vo.GroupJoinVO;
import com.spring.manage.vo.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int seek(GroupVO vo) {
		System.out.println("dao"+vo);
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.seek(vo);
	}
	
	@Override
	public ArrayList<GroupVO> list(Map<String, String> map, int startRecord, int countPerPage) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		return mapper.list(map, rb);
	}
	
	@Override
	public ArrayList<GroupVO> daredoko(GroupJoinVO gjvo){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.daredoko(gjvo);
	}

	@Override
	public int total_count(Map<String, String> map){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.total_count(map);
	}
	
	
	@Override
	public GroupVO paging(PageNavigator2 navi){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.paging(navi);
	}
	
	
	@Override
	public int member_count(int group_num){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.member_count(group_num);
	}
	
	
	@Override
	public GroupVO detail(GroupJoinVO gjvo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.detail(gjvo);
	}
	
	
	@Override
	public int join(GroupJoinVO vo){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		if(mapper.join_mae(vo) == null) {
			int result = mapper.join(vo);
			mapper.addEvent(vo); // 캘린더에 소모임 이벤트 추가
			return result;
		}
		else return 0;
	}
	
	@Override
	public ArrayList<GroupVO> mygroup(GroupJoinVO vo){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.mygroup(vo);
	}
	
	@Override
	public ArrayList<GroupVO> team(GroupJoinVO vo){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.team(vo);
	}

	@Override
	public ArrayList<GroupJoinVO> include() {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.include();
	}

	@Override
	public int penalty(GroupJoinVO gjvo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		if(mapper.penalty(gjvo)==null) return 0;
		else return mapper.penalty(gjvo);
	}

	@Override
	public ArrayList<GroupVO> grouppen(){
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.grouppen();
	}

	@Override
	public int insert_penalty(GroupJoinVO gjvo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.insert_penalty(gjvo);
	}

	@Override
	public int modify_penalty(GroupJoinVO gjvo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.modify_penalty(gjvo);
	}

	
	
	@Override
	public ArrayList<GroupJoinVO> penalty_list(GroupJoinVO gjvo) {
		GroupMapper mapper = sqlSession.getMapper(GroupMapper.class);
		return mapper.penalty_list(gjvo);
	}
	
	
}
