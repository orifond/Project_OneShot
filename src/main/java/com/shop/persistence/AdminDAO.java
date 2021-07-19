package com.shop.persistence;

import java.util.List;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;

public interface AdminDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register(GoodsVO vo) throws Exception;
}