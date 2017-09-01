package com.spring.manage.service;

import com.spring.manage.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO vo);

	public boolean join(MemberVO vo);

}
