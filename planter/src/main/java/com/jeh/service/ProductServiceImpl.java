package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeh.domain.ProductDTO;
import com.jeh.mapper.AttachMapper;
import com.jeh.mapper.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper pmapper;
	

	// 1.상품 등록 구현
	public void productReg(ProductDTO prod) {
		pmapper.productReg(prod);
	}
	
	// 2.상품 목록 설계
	public ArrayList<ProductDTO> shopList(){
		return pmapper.shopList();
	}
	
	// 3.상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod) {
		return pmapper.shopDetail(prod);
	}
}
