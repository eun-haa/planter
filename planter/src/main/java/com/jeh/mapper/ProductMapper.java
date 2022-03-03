package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.ProductDTO;

public interface ProductMapper {
	// 1.상품 등록 설계
	public void productReg(ProductDTO prod);
	public void insertSelectKey(ProductDTO prod);
	
	// 2.상품 목록 설계
	public ArrayList<ProductDTO> shopList();
	
	// 3.상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod);
}
