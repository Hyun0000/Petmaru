package com.petmaru.product.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static com.petmaru.common.DBCPTemplate.*;
import com.petmaru.product.member.model.vo.Product;

public class ProductMemberDao {
	//======================================================================================================
		// 상품 리스트 조회
		public ArrayList<Product> productList(Connection conn, String cateGory, int startRown, int endRown) {
			// 상품명, 사진, 가격
			ArrayList<Product> producClothestList = null;
			Product product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			String sql = "select * from product where product_category = ?";
//			String sql = "select PRODUCT_NAME, PRODUCT_IMAGE_URL, PRODUCT_PRICE, PRODUCT_CATEGORY from product where product_category = ?";
			
			// 페이징용 쿼리
			String sql  = " SELECT * from(select rownum rown, p.* from(select * from product where PRODUCT_CATEGORY = ? order by PRODUCT_NO ) p) where rown between ? and ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
//				switch (bno) {
//				case 1: category = "C"; break; // 옷
//				case 2: category = "A"; break; // 악세서리
//				case 3: category = "F"; break; // 음식
//				case 4: category = "B"; break; // 목욕
//				case 5: category = "T"; break; // 장난감
//				case 6: category = "H"; break; // 집
//				}
				pstmt.setString(1, cateGory);
				pstmt.setInt(2, startRown);
				pstmt.setInt(3, endRown);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					producClothestList = new ArrayList<Product>();
					do {
						product = new Product();
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
//				switch (bno) {
//				case 1: category = "C"; break; // 옷
//				case 2: category = "A"; break; // 악세서리
//				case 3: category = "F"; break; // 음식
//				case 4: category = "B"; break; // 목욕
//				case 5: category = "T"; break; // 장난감
//				case 6: category = "H"; break; // 집
//				}
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
		// 가져올 값 : PRODUCT_NAME, PRODUCT_IMAGE_URL, PRODUCT_COM, PRODUCT_PRICE
		public Product productDetail(Connection conn, int pno, String cateGory) {
			Product product = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product where PRODUCT_NO = ? and PRODUCT_CATEGORY = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, cateGory);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					product = new Product();
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
}
