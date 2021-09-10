package com.pet.rmaru.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pet.rmaru.product.model.vo.Product;

public class ProductDao {
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
}
