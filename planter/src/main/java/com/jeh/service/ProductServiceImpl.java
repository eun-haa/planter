package com.jeh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeh.domain.ProductDTO;
import com.jeh.mapper.AttachMapper;
import com.jeh.mapper.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper pmapper;
	
	@Autowired 
	AttachMapper amapper; // 파일 첨부
	
	// 1.상품 등록 구현
	public void productReg(ProductDTO prod) {
		if(prod.getAttachList() != null) {
			// 제목과 내용을 notice 테이블에 insert
			pmapper.insertSelectKey(prod);
			
			// 파일명,파일경로,파일타입, uuid 값을 attach 테이블에 insert
			// BoardDTO에 있는 attachList를 가져와서 반복문으로 실행하여 attach 변수에 저장
			prod.getAttachList().forEach(attach->{
				attach.setPno(prod.getPno());
				System.out.println("attach 테이블의 pno = " + prod.getPno());
				amapper.insert(attach);
			});
		}else {
			pmapper.productReg(prod);
		}
	}
}
