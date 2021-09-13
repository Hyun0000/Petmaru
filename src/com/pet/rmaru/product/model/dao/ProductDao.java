package com.pet.rmaru.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.pet.rmaru.product.model.vo.Product;

public class ProductDao {
//==============================================================================================
//==============================================================================================
	// 전체 상품 목록 조회
	public ArrayList<Product> productList(Connection conn, int sRum, int eRun ) {
		ArrayList<Product> productList = null;
		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList<Product>();
				product = new Product();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;
	}
//==============================================================================================
//==============================================================================================	
	// 특정 상품 검색
	// 검색어(String)를 입력받아 조회
	public ArrayList searchProduct(Connection conn, String keyword) {
		ArrayList<Product> arrayList = null;
		Product product = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_name like %?%";
		String sql2 = "select * from product where p_name like" + "'%" + keyword + "%'";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql2);
			
			if (rs.next()) {
				product = new Product();
				arrayList = new ArrayList<Product>();
				// TODO product 필드 set 하기 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrayList;
	}
}
