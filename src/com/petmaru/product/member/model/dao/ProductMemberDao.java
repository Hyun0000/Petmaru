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
						product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
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
					product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
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
			ArrayList<ProductMemberVo> mainsubcarousel = null;
			ProductMemberVo product = null;
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) {
					mainsubcarousel = new ArrayList<ProductMemberVo>();
					do {
						product = new ProductMemberVo();
						product.setProductCategory(rs.getString("PRODUCT_CATEGORY").charAt(0));
						product.setProductImgUrl(rs.getString("PRODUCT_IMAGE_URL"));
						mainsubcarousel.add(product);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(conn);
			}
			return mainsubcarousel;
		}
	//======================================================================================================
		// 결제 페이지 회원 정보 가져오기(체크박스)
		public MemberVo searchMembrtInfo(Connection conn, String id) {
			MemberVo member = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from member where MEMBER_ID = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				// 주소 번호 이름
				if (rs.next()) {
					member = new MemberVo();
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
}
