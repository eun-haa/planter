package com.jeh.service;

import java.util.ArrayList;

import com.jeh.domain.AttachFileDTO;
import com.jeh.domain.ProductDTO;

public interface ProductService {
	// 1.상품 등록 설계
	public void productReg(ProductDTO prod);
	
	// 2-1.상품 목록 설계
	public ArrayList<ProductDTO> shopList();
	// 2-2.상품 이미지 리스트
	public ArrayList<AttachFileDTO> fileList2();
	
	// 3.상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod);
	public ArrayList<AttachFileDTO> detailFile(int pno);
}
