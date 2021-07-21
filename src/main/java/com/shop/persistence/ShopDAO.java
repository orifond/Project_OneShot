package com.shop.persistence;

import java.util.List;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.ReplyListVO;
import com.shop.domain.ReplyVO;

public interface ShopDAO {

	// 카테고리별 상품 리스트 : 1차 분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;

	// 카테고리별 상품 리스트 : 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	// 상품 조회
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