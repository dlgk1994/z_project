package com.care.root.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.admin.product.service.productService;



@Controller
public class PaymentController {
	
	@RequestMapping("payment/paymentForm")   //결제 폼
	   public String paymentForm() {
		
	      return "payment/paymentForm";
	   }
	@RequestMapping("payment/payment")   //결제 api
	   public String payment() {
	      return "payment/payment";
	   }
	@RequestMapping("payment/paymentFinish")   //결제완료
	   public String paymentFinish() {
	      return "payment/paymentFinish";
	 }
	
}
