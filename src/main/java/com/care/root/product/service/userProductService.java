package com.care.root.product.service;

import org.springframework.ui.Model;

public interface userProductService {

	public void productList(Model model);

	public void selectImg(String productNum, Model model);

	public void productView(String productNum, Model model);

}
