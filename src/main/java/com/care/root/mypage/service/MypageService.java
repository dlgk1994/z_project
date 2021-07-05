package com.care.root.mypage.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.mypage.dto.CartDTO;


public interface MypageService {
	//장바구니 전체 목록
	public void myCart(Model model, int num);
	//장바구니 내역 삭제
	public void deleteCart(CartDTO cart);
	//주문 내역 전체 목록
	public void myRental(Model model, int num);
	//내 리뷰 전체 목록
	public void myReview(Model model, int num);
	//내 리뷰 저장
	public void reviewSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	//내 리뷰 클릭 시 상세보기
	public void selectReview(Model model, int review_no);
	//내 리뷰 수정
	public void modifyReviewSave(Model model, int review_no, MultipartHttpServletRequest mul);
	//내 리뷰 삭제
	public void deleteReview(int review_no, String review_file1, String review_file2, String review_file3);
}
