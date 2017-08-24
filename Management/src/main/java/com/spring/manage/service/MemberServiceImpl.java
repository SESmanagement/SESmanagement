package com.spring.manage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.manage.dao.MemberDAO;
import com.spring.manage.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO login(MemberVO vo) {
		vo = dao.login(vo);
		return vo;
	}

	@Override
	public void join(MemberVO vo, MultipartFile photo) {
		
	}

}
