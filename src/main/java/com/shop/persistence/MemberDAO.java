package com.shop.persistence;

import com.shop.domain.MemberVO;

public interface MemberDAO {
	
	// 회원 가입
	public void signup(MemberVO vo) throws Exception;

}