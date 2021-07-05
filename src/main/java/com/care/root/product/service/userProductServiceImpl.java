package com.care.root.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.adminProduct.mtbatis.productMapper;
import com.care.root.product.mybatis.userProductMapper;
@Service
public class userProductServiceImpl implements userProductService{
	@Autowired userProductMapper mapper;
	//@Autowired productMapper promapper;
	@Override
	public void productList(Model model) {
		model.addAttribute("productList",mapper.productList());
		
		
	}
	//상품상세보기
	@Override
	public void productView(String productNum, Model model) {
		model.addAttribute("productView",mapper.adminProductView(productNum));
		
	}
	//상품상세보기 이미지
	@Override
	public void selectImg(String productNum, Model model) {
		model.addAttribute("productImg",mapper.attachmentList(productNum));
		
	}
	@Override
	public void thumselectImg(Model model) {
		model.addAttribute("attachmentThumList"+mapper.attachmentThumList());
		
	};
	
	
	

}
