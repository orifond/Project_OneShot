package com.shop.service;

import java.util.List;

import com.shop.domain.CategoryVO;


public interface AdminService {

	// 카테고리 
	public List<CategoryVO> category() throws Exception;
}