package com.jeh.mapper;

import com.jeh.domain.ProductDTO;

public interface ProductMapper {
	// 1.상품 등록 설계
	public void productReg(ProductDTO prod);
	public void insertSelectKey(ProductDTO prod);
}
