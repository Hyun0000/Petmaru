package com.petmaru.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.petmaru.member.model.vo.Member;

public class MemberDao {
	// 회원가입 1단계 : ID 중복체크
	// result = 1 (기존 아이디 존재, 회원가입 불가) / result = 0 (아이디 없음, 회원가입 가능) 
	public int checkId(Connection conn, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id = ?";
		// * 보다는 회원번호(시퀀스)를 가져오는 것으로 수정 요망
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1; // 중복 아이디 존재
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//TODO close() 
		}
		return result;
	}
	// 회원가입 2단계 : 회원가입 진횅
	// result = 1 (회원가입 성공) / result = 0 (회원가입 실패) 
	public int joinMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			//TODO 테이블 작성후 추가로 작성
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//TODO close() 
		}
		return result;
	}
	// 회원삭제
	// 조건 : ID (ID는 중복이 없으므로)
	public int deleteMember(Connection conn, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from member where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//TODO close() 
		}
		return result;
	}
}
