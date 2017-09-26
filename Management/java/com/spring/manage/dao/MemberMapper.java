package com.spring.manage.dao;

import com.spring.manage.vo.MemberVO;

public interface MemberMapper {

	public MemberVO login(MemberVO vo);

	public int join(MemberVO vo);
}
