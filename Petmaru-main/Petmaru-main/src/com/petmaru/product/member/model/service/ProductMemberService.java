package com.petmaru.product.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.petmaru.common.DBCPTemplate.*;
import com.petmaru.product.member.model.dao.ProductMemberDao;
import com.petmaru.product.member.model.vo.Product;

public class ProductMemberService {
	//======================================================================================================
		// 상품 리스트 조회
		public ArrayList<Product> productList(String cateGory, int startRown, int endRown) {
			ArrayList<Product> producClothestList = null;
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
		// 상품 상세 페이지
		public Product productDetail(int pno, String cateGory) {
			Product product = null;
			Connection conn = getConnection();
			product = new ProductMemberDao().productDetail(conn, pno, cateGory);
			close(conn);
			return product;
		}

}
