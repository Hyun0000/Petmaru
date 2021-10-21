package com.petmaru.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPTemplate {

	private DBCPTemplate() {}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Context firstSearch = new InitialContext();
			Context secondSearch = (Context)firstSearch.lookup("java:comp/env");
			//DataSource ds = (DataSource)secondSearch.lookup("jdbc/petmaruLocal");
		    DataSource ds = (DataSource)secondSearch.lookup("jdbc/petmaruDclass");
			conn = ds.getConnection();
			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
//============================================================================================================
	public static void close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//=======================================================================================================================	
	public static void close(Statement stmt) {
		try {
			if (stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//=======================================================================================================================
	public static void close(ResultSet rest) {
		try {
			if (rest != null && !rest.isClosed()) {
				rest.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//============================================================================================================
	// DB 에서 일어나는 트랜잭션 commit 처리
	public static void commit(Connection conn) {
		try {
			if (conn != null && !conn.isClosed())
				conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//============================================================================================================
	// DB 에서 일어나는 트랜잭션 rollBack 처리
	public static void rollBack(Connection conn) {
		try {
			if (conn != null && !conn.isClosed())
				conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//============================================================================================================
	public static void setAutoCommit(Connection conn, boolean onOff) {
		try {
			conn.setAutoCommit(onOff);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
}
