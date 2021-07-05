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
	@Override
	public void productView(String productNum, Model model) {
		model.addAttribute("productView",mapper.adminProductView(productNum));
		
	}
	@Override
	public void selectImg(String productNum, Model model) {
		model.addAttribute("productImg",mapper.attachmentList(productNum));
		
	}
	

}
