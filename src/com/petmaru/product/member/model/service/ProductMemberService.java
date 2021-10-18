package com.petmaru.product.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static com.petmaru.common.DBCPTemplate.*;

import com.petmaru.member.model.vo.MemberVo;
import com.petmaru.product.member.model.dao.ProductMemberDao;
import com.petmaru.product.member.model.vo.ProductMemberVo;

public class ProductMemberService {
	//======================================================================================================
		// 상품 리스트 조회
		public ArrayList<ProductMemberVo> productList(String cateGory, int startRown, int endRown) {
			ArrayList<ProductMemberVo> producClothestList = null;
			Connection conn = getConnection();
			producClothestList = new ProductMemberDao().productList(conn, cateGory, startRown, endRown);
			close(conn);
			return producClothestList;
		}
	//======================================================================================================
		// 상품 전체 개수 조회
		public int totalProduct(String cateGory) {
			int result = 0;
			Connection conn = getConnection();
			result = new ProductMemberDao().totalProduct(conn, cateGory);
			close(conn);
			return result;
		}
	//======================================================================================================
		// 후기 작성 버튼 SHOW, HIDE
		public String reviewInsertBtnShow(int pno, String id) {
			String payYN = null;
			Connection conn = getConnection();
			payYN = new ProductMemberDao().reviewInsertBtnShow(conn, pno, id);
			close(conn);
			return payYN;
		}
	//======================================================================================================
		// 상품 상세 페이지
		public ProductMemberVo productDetail(int pno, String cateGory) {
			ProductMemberVo product = null;
			Connection conn = getConnection();
			product = new ProductMemberDao().productDetail(conn, pno, cateGory);
			close(conn);
			return product;
		}
	//======================================================================================================
		// 상품 구매 페이지
		public ProductMemberVo productbuy(int pno) {
			// TODO Auto-generated method stub
			ProductMemberVo product = null;
			Connection conn = getConnection();
			product = new ProductMemberDao().buyproduct(conn, pno);
			close(conn);
			return product;
		}
	//======================================================================================================
		// 메인 페이지 서브 캐러샐
		public ArrayList<ProductMemberVo> mainsubcarousel() {
			ArrayList<ProductMemberVo> mainsubcarousel = null;
			Connection conn = getConnection();
			mainsubcarousel = new ProductMemberDao().mainsubcarousel(conn);
			close(conn);
			return mainsubcarousel;
		}
	//======================================================================================================
		// 결제 페이지 회원 정보 가져오기(체크박스)
		public MemberVo searchMembrtInfo(String id) {
			MemberVo member = null;
			Connection conn = getConnection();
			member = new ProductMemberDao().searchMembrtInfo(conn, id);
			close(conn);
			return member;
		}
	//======================================================================================================
		// 상품 검색
		public List<ProductMemberVo> productMemberSearch(String keyword) {
			ArrayList<ProductMemberVo> productMemberSearch = null;
			Connection conn = getConnection();
			productMemberSearch = new ProductMemberDao().productMemberSearch(conn, keyword);
			close(conn);
			return productMemberSearch;
		}
}
