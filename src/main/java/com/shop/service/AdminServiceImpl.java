package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);		
	}
	
	// 상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return dao.goodslist();
	}
	
	// 상품조회
	@Override
	public GoodsVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
} 