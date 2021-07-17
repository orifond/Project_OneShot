package com.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.MemberVO;
import com.shop.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;

	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}

}
