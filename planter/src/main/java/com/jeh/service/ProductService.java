package com.jeh.service;

import java.util.ArrayList;

import com.jeh.domain.AttachFileDTO;
import com.jeh.domain.ProductDTO;
import com.jeh.domain.Search;
import com.jeh.domain.ShopSearch;

public interface ProductService {
	// 1.상품 등록 설계
	public void productReg(ProductDTO prod);
	
	// 2-1.SHOP 상품 목록 설계
	public ArrayList<ProductDTO> shopList(ShopSearch ssc);
	public ArrayList<ProductDTO> prodInfoList(); // 목록 화면에 파일 띄우기 위함
	// SHOP 상품 목록 페이징 - 상품 전체 갯수
	public int getTotalCount1(ShopSearch ssc);

	
	
	
	// 2-2.SHOP 상품 이미지 리스트
	public ArrayList<AttachFileDTO> fileList2();
	// 2-3.ADMIN 상품 목록 설계
	public ArrayList<ProductDTO> adminList(Search sc);
	// ADMIN 상품 목록 페이징 - 상품 전체 갯수
	public int getTotalCount2(Search sc);
	
	// 3.상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod);
	public ArrayList<AttachFileDTO> detailFile(int pno);
	
	// 4.상품 수정 설계
	public void postModify(ProductDTO prod);
	
	// 5.글 삭제 설계
	public void delete(ProductDTO prod);
}
