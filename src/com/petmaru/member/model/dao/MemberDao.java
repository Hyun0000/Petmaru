package com.petmaru.member.model.dao;

import static com.petmaru.common.DBCPTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.model.vo.MemberVo;

public class MemberDao {

	public MemberDao() {

	}
	public ArrayList<MemberVo> selectList(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo m = null;
		String query = "select * from member";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MemberVo();
				m.setMember_id(rset.getString("member_id")); 
				m.setMember_name(rset.getString("member_name"));
				m.setMember_pwd(rset.getString("member_pwd"));
				m.setMember_phone(rset.getString("Member_phone"));
				m.setMember_address(rset.getString("Member_address"));
				m.setMember_regdate(rset.getDate("Member_regdate"));
				m.setMember_gender(rset.getString("Member_gender"));
				m.setMember_point(rset.getInt("Member_point"));
				m.setMember_email(rset.getString("Member_email"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBCPTemplate.close(rset);
			DBCPTemplate.close(pstmt);
		}
		return list;
	}
	//관리자가 회원전체 출력시 아이디로 검색
		public ArrayList<MemberVo> searchKeywordId(Connection conn, String keyword) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "select * from member where member_id=?";
			ArrayList<MemberVo> list = new ArrayList<MemberVo>();
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, keyword);
				rset = pstmt.executeQuery();
				while (rset.next()) {
					MemberVo m = new MemberVo();
					m.setMember_id(rset.getString("member_id")); 
					m.setMember_name(rset.getString("member_name"));
					m.setMember_pwd(rset.getString("member_pwd"));
					m.setMember_phone(rset.getString("Member_phone"));
					m.setMember_address(rset.getString("Member_address"));
					m.setMember_regdate(rset.getDate("Member_regdate"));
					m.setMember_gender(rset.getString("Member_gender"));
					m.setMember_point(rset.getInt("Member_point"));
					m.setMember_email(rset.getString("Member_email"));
					list.add(m);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBCPTemplate.close(pstmt);
				DBCPTemplate.close(rset);
			}
			return list;
		}

		//관리자가 회원전체 출력시 이름으로 검색
		public ArrayList<MemberVo> searchKeywordName(Connection conn, String keyword) {

			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "select * from member where member_name like (?)"; // ( ) 없어도 상관없음!!
			ArrayList<MemberVo> list = new ArrayList<MemberVo>();
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + keyword + "%");
				rset = pstmt.executeQuery();
				while (rset.next()) {
					MemberVo m = new MemberVo();
					
					m.setMember_id(rset.getString("member_id")); 
					m.setMember_name(rset.getString("member_name"));
					m.setMember_pwd(rset.getString("member_pwd"));
					m.setMember_phone(rset.getString("Member_phone"));
					m.setMember_address(rset.getString("Member_address"));
					m.setMember_regdate(rset.getDate("Member_regdate"));
					m.setMember_gender(rset.getString("Member_gender"));
					m.setMember_point(rset.getInt("Member_point"));
					m.setMember_email(rset.getString("Member_email"));
					
					list.add(m);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBCPTemplate.close(pstmt);
				DBCPTemplate.close(rset);
			}
			return list;
		}
	    //회원정보수정
		public int updateMember(Connection conn, MemberVo m) {

			int result = 0;
			PreparedStatement pstmt = null;
			String query = "update member set member_name=?, member_gender=?, member_email=?, member_phone=?, member_Point=Point+? where member_id=?";

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, m.getMember_name());
				pstmt.setString(2, m.getMember_gender());
				pstmt.setString(3, m.getMember_email());
				pstmt.setString(4, m.getMember_phone());
				pstmt.setInt(5, m.getMember_point());
				pstmt.setString(6, m.getMember_id());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBCPTemplate.close(pstmt);
			}
			return result;

		}
		public int deleteMember(Connection conn, String id) {

			int result = 0;
			PreparedStatement pstmt = null;
			String query = "delete from member where member_id = ?";

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBCPTemplate.close(pstmt);
			}
			return result;
		}
	
	public int insertMember(Connection conn, MemberVo vo) { // 회원가입
		int result = -1;
		String sqlInsert = "INSERT INTO" + " MEMBER" + " VALUES (?, ?, ?, ?, ?, sysdate, ?, ?, ?)";
		PreparedStatement pstmt = null;
		// System.out.println(vo);
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
		String sql = "select MEMBER_PW from MEMBER where MEMBER_ID=? and MEMBER_PW =?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rset = pstmt.executeQuery();
			System.out.println("dao id : " + id);
			System.out.println("dao pwd : " + pwd);
			
			if (rset.next()) {
				System.out.println("정보 가져오기 성공");
				String dbPwd = rset.getString(1);
				if (pwd.equals(dbPwd)) {
					System.out.println("로그인 성공");
					result = 1;
				} else { // pwd 가 틀림
					System.out.println("로그인 실패");
					result = 0;
				}
			} else {
				System.out.println("해당하는 id가 없다.");
				result = 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCPTemplate.close(pstmt);
		}
		return result;
	}

	// 중복확인
	public int checkDuplicatedMember(Connection conn, MemberVo vo) {
		int result = -1;
		String sql = "select member_id 	from member where member_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getMember_id());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = 2; // 기존회원이 있으면
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 여기 -1
		} finally {
			DBCPTemplate.close(rset);
			DBCPTemplate.close(pstmt);
		}
		return result;
	}
}
