package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeh.domain.AttachFileDTO;

import com.jeh.domain.ProductDTO;
import com.jeh.domain.Search;
import com.jeh.domain.ShopSearch;
import com.jeh.mapper.AttachMapper;
import com.jeh.mapper.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper pmapper;
	
	@Autowired
	AttachMapper amapper;
	

	// 1.상품 등록 구현
	@Transactional
	public void productReg(ProductDTO prod) {
		if(prod.getAttachList() != null) {
			// 제목과 내용을 product 테이블에 insert
			pmapper.insertSelectKey(prod);
			
			// 파일명,파일경로,파일타입,uuid 값을 attach 테이블에 insert
			// BoardDTO에 있는 attachList를 가져와서 반복문으로 실행하여 attach 변수에 저장
			prod.getAttachList().forEach(attach->{
				attach.setPno(prod.getPno());
				System.out.println("attach 테이블의 pno = " + prod.getPno());
				amapper.insert2(attach);
			});
		}else {
			pmapper.productReg(prod);
		}
	}
	
	// 2-1.상품 목록 구현
	@Override
	public ArrayList<ProductDTO> shopList(ShopSearch ssc){
		return pmapper.shopList(ssc);
	}
	@Override
	public ArrayList<ProductDTO> prodInfoList(){
		return pmapper.prodInfoList();
	}
	// 2-2.상품 이미지 구현
	@Override
	public ArrayList<AttachFileDTO> fileList2(){
		return amapper.fileList2();
	}
	// SHOP 상품 목록 페이징 - 상품 전체 갯수
	@Override
	public int getTotalCount1(ShopSearch ssc) {
		return pmapper.getTotalCount1(ssc);
	}
	// 2-3.ADMIN 상품 목록 설계
	@Override
	public ArrayList<ProductDTO> adminList(Search sc){
		return pmapper.adminList(sc);
	}
	@Override
	// ADMIN 상품 목록 페이징 - 상품 전체 갯수
	public int getTotalCount2(Search sc) {
		return pmapper.getTotalCount2(sc);
	}
	
	// 3-1.PLANT 카테고리 상품 목록 구현
	@Override
	public ArrayList<ProductDTO> shopList1(ShopSearch ssc){
		return pmapper.shopList1(ssc);
	}
	// 3-2.FLOWER 카테고리 상품 목록 구현
	@Override
	public ArrayList<ProductDTO> shopList2(ShopSearch ssc){
		return pmapper.shopList2(ssc);
	}
	// 3-2.GARDENING 카테고리 상품 목록 구현
	@Override
	public ArrayList<ProductDTO> shopList3(ShopSearch ssc){
			return pmapper.shopList3(ssc);
	}
	// 3-2.PLANTERIOR 카테고리 상품 목록 구현
	@Override
	public ArrayList<ProductDTO> shopList4(ShopSearch ssc){
		return pmapper.shopList4(ssc);
	}
	
	// 4.상품 상세 구현
	@Transactional
	public ProductDTO shopDetail(ProductDTO prod) {
		// 상품 조회수 업데이트
		pmapper.hitUpdate(prod);
		
		return pmapper.shopDetail(prod);
	}
	// 3-2.상세페이지에 업로드 된 이미지를 화면에 보여주기 위한 데이터 list 구현
	@Override
	public ArrayList<AttachFileDTO> detailFile(int pno){
		return amapper.detailFile(pno);
	}
	
	// 4.상품 수정 구현
	@Transactional
	public void postModify(ProductDTO prod) {
		if(prod.getAttachList() != null) {
			pmapper.postModify(prod);
			System.out.println("amapper.deleteFile(prod.getPno());");
			amapper.deleteFile(prod.getPno());
			// 파일명,파일경로,파일타입,uuid 값을 attach 테이블에 insert
			// BoardDTO에 있는 attachList를 가져와서 반복문으로 실행하여 attach 변수에 저장
			prod.getAttachList().forEach(attach->{
				attach.setPno(prod.getPno());
				System.out.println("attach 테이블의 pno = " + prod.getPno());
				amapper.insert2(attach);
			});
		}else {
			pmapper.postModify(prod);
		}
	}
	
	// 6.글 삭제 구현
	@Override
	public void delete(ProductDTO prod) {
		if(prod.getAttachList() != null) {
			amapper.deleteFile2(prod.getPno());
			pmapper.delete(prod);
		}else {
			pmapper.delete(prod);
		}

	}
	// 7.검색 결과 구현
	@Override
	public ArrayList<ProductDTO> searchList(ShopSearch ssc){
		return pmapper.searchList(ssc);
	}
}
