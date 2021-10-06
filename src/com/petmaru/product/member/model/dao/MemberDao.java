package com.petmaru.product.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.model.vo.Member;

public class MemberDao {

	public MemberDao() {

	}

	public int insertMember(Connection conn,Member vo) { // 회원가입
		int result = -1;
		String sqlInsert = "INSERT INTO" 
							+ " MEMBER" 
							+ " VALUES (?, ?, ?, ?, ?, sysdate, ?, ?, ?)";
		PreparedStatement pstmt = null;
		//System.out.println(vo);
		try {

			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, vo.getMember_id());
			pstmt.setString(2, vo.getMember_name());
			pstmt.setString(3, vo.getMember_pwd());
			pstmt.setString(4, vo.getMember_phone());
			pstmt.setString(5, vo.getMember_address());
			pstmt.setString(6, String.valueOf(vo.getMember_gender()));
			pstmt.setInt(7, vo.getMember_point());
			pstmt.setString(8, vo.getMember_email());
			result = pstmt.executeUpdate();
			DBCPTemplate.commit(conn);
			System.out.println(result);
			System.out.println(vo);
		} catch (Exception e) {
			e.printStackTrace();
			// 여기 -1
		} finally {
			DBCPTemplate.close(pstmt);
		}
		return result;
	}

	public int loginmember(Connection conn, String id, String pwd) { // 로그인
		int result = -1;
		String sql = "select MEMBER_ID from MEMBER where MEMBER_ID=? and MEMBER_PW =?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
//			System.out.println("ymkim" + id);
//			System.out.println("ymkim" + pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
//			System.out.println("ymkim" + 3);
			rset = pstmt.executeQuery();
//			System.out.println("ymkim" + 4);
			if (rset.next()) {
//				System.out.println("ymkim" + 1);
				String dbPwd = rset.getString(1);
				if (pwd.equals(dbPwd)) {
//					System.out.println("ymkim" + 2);
					// pwd 도 같음  로그인 성공
					result = 0;
				} else {
					// pwd 가 틀림
					result = 1;
				}
			} else {
				// id없음
				System.out.println("ymkim " + 6);
				result = 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCPTemplate.close(pstmt);
		}
		return result;
	}
	//중복확인
	public int checkDuplicatedMember(Connection conn, Member vo) {
		int result =-1;
		String sql = "select member_id 	from member where member_id=?";
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMember_id());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 2;  //  기존회원이 있으면
			} else {
				result = 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			// 여기 -1
		} finally {
			DBCPTemplate.close(rset);
			DBCPTemplate.close(pstmt);
		}
		return result;
	}
}
