package com.care.root.product.mybatis;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.product.dto.userProductDTO;

public interface userProductMapper {

	public ArrayList<productDTO> productList();

	public productImageDTO attachmentList(String productNum);

	public productDTO adminProductView(String productNum);

	public ArrayList<userProductDTO> attachmentThumList();

	

	

}
