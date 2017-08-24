package com.spring.manage.service;

import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO vo);

	public void join(MemberVO vo, MultipartFile photo);

}
