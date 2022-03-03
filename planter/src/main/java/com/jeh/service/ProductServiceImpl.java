package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeh.domain.AttachFileDTO;
import com.jeh.domain.ProductDTO;
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
	public ArrayList<ProductDTO> shopList(){
		return pmapper.shopList();
	}
	// 2-2.상품 이미지 구현
	public ArrayList<AttachFileDTO> fileList2(){
		return amapper.fileList2();
	}
	
	// 3.상품 상세 구현
	public ProductDTO shopDetail(ProductDTO prod) {
		return pmapper.shopDetail(prod);
	}
	// 3-2.상세페이지에 업로드 된 이미지를 화면에 보여주기 위한 데이터 list 구현
	public ArrayList<AttachFileDTO> detailFile(int pno){
		return amapper.detailFile(pno);
	}
	
	// 4.상품 수정 설계
	public void postModify(ProductDTO prod) {
		pmapper.postModify(prod);
	}
	
	// 5.글 삭제 설계
	public void delete(ProductDTO prod) {
		pmapper.delete(prod);
	}
}
