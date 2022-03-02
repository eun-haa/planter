package com.jeh.service;

import java.util.ArrayList;

import com.jeh.domain.ProductDTO;

public interface ProductService {
	// 1.상품 등록 설계
	public void productReg(ProductDTO prod);
	
	// 2.상품 목록 설계
	public ArrayList<ProductDTO> shopList();
	
	// 3.상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod);
}
