package com.petmaru.product.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import static com.petmaru.common.DBCPTemplate.*;

import com.petmaru.member.model.vo.MemberVo;
import com.petmaru.product.member.model.vo.ProductMemberVo;

public class ProductMemberDao {
	//======================================================================================================
		// 상품 리스트 조회
		public ArrayList<ProductMemberVo> productList(Connection conn, String cateGory, int startRown, int endRown) {
			// 상품명, 사진, 가격
			ArrayList<ProductMemberVo> producClothestList = null;
			ProductMemberVo product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 페이징용 쿼리
			String sql  = " SELECT * from(select rownum rown, p.* from(select * from product where PRODUCT_CATEGORY = ? order by PRODUCT_NO ) p) where rown between ? and ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cateGory);
				pstmt.setInt(2, startRown);
				pstmt.setInt(3, endRown);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					producClothestList = new ArrayList<ProductMemberVo>();
					do {
						product = new ProductMemberVo();
						product.setProductNo(rs.getInt("PRODUCT_NO"));
						product.setProductCategory(rs.getString("PRODUCT_CATEGORY"));
						// product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
						product.setProductName(rs.getString("PRODUCT_NAME"));
						product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
						product.setPrice(rs.getInt("PRODUCT_PRICE"));
						producClothestList.add(product);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return producClothestList;
		}
	//======================================================================================================
		// 상품 전체 개수 조회
		public int totalProduct(Connection conn, String cateGory) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select count(PRODUCT_NO) from product where PRODUCT_CATEGORY = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cateGory);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
	//======================================================================================================
		// 상품 상세 페이지
		// 조건 : PRODUCT_NO & PRODUCT_CATEGORY
		// 가져올 값 : PRODUCT_NAME, PRODUCT_IMAGE_URL, PRODUCT_COM, PRODUCT_PRICE, PRODUCT_CATEGORY
		public ProductMemberVo productDetail(Connection conn, int pno, String cateGory) {
			ProductMemberVo product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product where PRODUCT_NO = ? and PRODUCT_CATEGORY = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, cateGory);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					product = new ProductMemberVo();
					product.setProductCategory(rs.getString("PRODUCT_CATEGORY"));
					// product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
					product.setProductNo(rs.getInt("PRODUCT_NO"));
					product.setProductName(rs.getString("PRODUCT_NAME"));
					product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
					product.setCom(rs.getString("PRODUCT_COM"));
					product.setPrice(rs.getInt("PRODUCT_PRICE"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return product;
		}
	//======================================================================================================
		// 상품 구매 페이지
		public ProductMemberVo buyproduct(Connection conn, int pno) {
			ProductMemberVo product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product where PRODUCT_NO = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					product = new ProductMemberVo();
					product.setProductName(rs.getString("PRODUCT_NAME"));
					product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
					product.setPrice(rs.getInt("PRODUCT_PRICE"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return product;
		}
	//======================================================================================================
		// 메인 페이지 서브 캐러샐	
		public ArrayList<ProductMemberVo> mainsubcarousel(Connection conn) {
			// 난수 생성(1~88 사이의 난수 발생)
			// System.out.println("0 ~ 100 사이의 난수 1개 발생 : " + (int)(Math.random()*88));
			
			final int DISPLAY_ZISE = 12; // 한 캐러셀 당 보여질 상품 개수
			int allPrice = totalProduct(conn, "C");
			// 카테고리별 상품 총 개수(카테고리별 상품 개수가 모두 동일하다는 가정하에 "C"를 인자로 넣는다.)
			
			int startRown = (int)(Math.random()*(allPrice-DISPLAY_ZISE));
			int endRown =  startRown + DISPLAY_ZISE - 1;
			System.out.println("startRown : " + startRown);
			System.out.println("endRown : " + endRown);
			
			ArrayList<ProductMemberVo> mainsubcarousel = null;
			ProductMemberVo product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			
			String sql = "SELECT p.* from( SELECT PRODUCT_NO, PRODUCT_CATEGORY, PRODUCT_IMAGE_URL, ROW_NUMBER() OVER (PARTITION BY PRODUCT_CATEGORY ORDER BY PRODUCT_NO) AS NUM FROM PRODUCT) p where NUM between ? and ?"; 
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRown);
				pstmt.setInt(2, endRown);
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					mainsubcarousel = new ArrayList<ProductMemberVo>();
					do {
						product = new ProductMemberVo();
						product.setProductCategory(rs.getString("PRODUCT_CATEGORY"));
						// product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
						product.setProductNo(rs.getInt("PRODUCT_NO"));
						product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
						mainsubcarousel.add(product);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return mainsubcarousel;
		}
	//======================================================================================================
		// 후기 작성 버튼 SHOW, HIDE
		public String reviewInsertBtnShow(Connection conn, int pno, String id) {
			String payYN = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT ORDER_PAY FROM ORDERS WHERE ORDER_PRODUCT_PNO = ? AND ORDER_MEMBER_ID = ?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					payYN = rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			// 아예 주문한 경우가 없는 경우 payYN가 null이 되는 것을 방지
			if (payYN == null) { payYN = "해당 회원은 해당 물품을 주문 하지 않았습니다."; }
			return payYN;
		}
	//======================================================================================================
		// 결제 페이지 회원 정보 가져오기(체크박스)
		public MemberVo searchMembrtInfo(Connection conn, String id) {
			MemberVo member = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from member where MEMBER_ID = ? ";
//		    MEMBER_ID 		VARCHAR2(500) @		CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
//		    MEMBER_NAME 		CHAR(20) @			CONSTRAINT MEMBER_NAME_NN NOT NULL,
//		    MEMBER_PW 		VARCHAR2(500) @		CONSTRAINT MEMBER_PW_NN NOT NULL,
//		    MEMBER_PHONE 		CHAR(15) 	@		CONSTRAINT MEMBER_PHONE_NN NOT NULL,
//		    MEMBER_ADDRESS 	VARCHAR2(500) 	@	CONSTRAINT MEMBER_ADDRESS_NN NOT NULL,
//		    MEMBER_BIRTH 		NUMBER(10) 	@		CONSTRAINT MEMBER_BIRTH_NN NOT NULL,
//		    MEMBER_EMAIL 		VARCHAR2(300) @		CONSTRAINT MEMBER_EMAIL_UK UNIQUE,
//		    MEMBER_GENDER 	CHAR(1) 			CONSTRAINT MEMBER_GENDER_CK CHECK(MEMBER_GENDER IN ('M','F')),
//		    MEMBER_POINT 		NUMBER 				DEFAULT 0,
//		    MEMBER_REGDATE 	DATE 				DEFAULT SYSDATE
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				// 주소 번호 이름
				if (rs.next()) {
					member = new MemberVo();
					member.setMember_point(rs.getInt("MEMBER_POINT"));
					member.setMember_address(rs.getString("MEMBER_ADDRESS"));
					member.setMember_phone(rs.getString("MEMBER_PHONE"));
					member.setMember_name(rs.getString("MEMBER_NAME"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(member);
			return member;
		}
	//======================================================================================================
		// 상품 검색
		public ArrayList<ProductMemberVo> productMemberSearch(Connection conn, String keyword) {
			ArrayList<ProductMemberVo> productMemberSearch = null;
			ProductMemberVo product = null;
			Statement stmt = null;
			ResultSet rs = null;
			// PreparedStatement는 like의 (%?%) 부분을 쉼표처리하기가 까다로워 Statement를 사용한다.
			String sql = "SELECT PRODUCT_CATEGORY, PRODUCT_NO, PRODUCT_IMAGE_URL,PRODUCT_NAME, PRODUCT_PRICE FROM PRODUCT WHERE PRODUCT_TAG LIKE '%" + keyword + "%' OR PRODUCT_NAME LIKE '%" + keyword + "%'"; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					productMemberSearch = new ArrayList<ProductMemberVo>();
					do {
						product = new ProductMemberVo();
						product.setProductCategory(rs.getString("PRODUCT_CATEGORY"));
						product.setProductNo(rs.getInt("PRODUCT_NO"));
						product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
						product.setProductName(rs.getString("PRODUCT_NAME"));
						product.setPrice(rs.getInt("PRODUCT_PRICE"));
						productMemberSearch.add(product);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(stmt);
			}
			return productMemberSearch;
		}
}
