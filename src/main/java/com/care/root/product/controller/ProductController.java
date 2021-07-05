package com.care.root.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.admin.product.service.productService;
import com.care.root.product.service.userProductService;


@Controller
public class ProductController {
	@Autowired userProductService ps;
	//상품 리스트
	@GetMapping("Product/ProductList")
	public String adminProductList(Model model/*,@RequestParam String productNum*/){
		ps.productList(model);
		
		//ps.selectImg(productNum,model);//수정 페이지에서 썸네일 불러오기 
		return "Product/ProductList";
	}
		
	//상품 내용 확인 
	@RequestMapping("Product/ProductView")
	public String adminProductView(@RequestParam String productNum, Model model) {
		ps.productView(productNum,model);
		ps.selectImg(productNum,model);//수정 페이지에서 썸네일 불러오기 
		return "Product/ProductView";
	}
		
	//상품 검색
	@RequestMapping("Product/productSearch")
	public String adminProductSearch(){
		
		return "Product/productSearch";
	}
	
}
