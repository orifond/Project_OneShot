package com.shop.service;

import java.util.List;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopService {

	// 카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level)  throws Exception;
	
	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	// 상품 리뷰 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	// 상품 리뷰 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	// 카트 담기
	public void addCart(CartListVO cart) throws Exception;
	
	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
}