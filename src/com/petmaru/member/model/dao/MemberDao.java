package com.petmaru.member.model.dao;

import static com.petmaru.common.DBCPTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.model.vo.MemberVo;


public class MemberDao {

	public MemberDao() {

	}

	public ArrayList<MemberVo> MemberListAll(Connection conn ,int start, int end) {
		ArrayList<MemberVo> volist = null;

		String sql = "select Member_id,Member_name,Member_gender,Member_regdate from (select Rownum r, t1.* from (select * from member order by member_regdate desc) t1 ) where r between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			volist = new ArrayList<MemberVo>();
			if (rset.next()) {
				do {
					MemberVo vo = new MemberVo();
					vo.setMember_id(rset.getString("Member_id"));
					vo.setMember_name(rset.getString("Member_name"));
					vo.setMember_gender(rset.getString("Member_gender"));
					vo.setMember_regdate(rset.getDate("Member_regdate"));
//					vo.setMember_phone(rset.getString("member_phone"));
//					vo.setMember_pw(rset.getString("Member_pw"));
//					vo.setMember_address(rset.getString("member_address"));
//					vo.setMember_point(rset.getInt("point"));
//					vo.setMember_email(rset.getString("Member_email"));
					volist.add(vo);
				} while (rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			DBCPTemplate.close(rset);
			DBCPTemplate.close(pstmt);
//			try {
//				rset.close();
//				pstmt.close();
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
		}
		System.out.println("[ejkim]-- 리턴은" + volist);
		return volist;
	}
	public int getMemberCount(Connection conn) {
		int result = 0;
		String sql = "select count(Member_name) from Member";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCPTemplate.close(rset);
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
		String sql = "select MEMBER_ID from MEMBER where MEMBER_ID=? and MEMBER_PW =?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				String dbPwd = rset.getString(1);
				if (pwd.equals(dbPwd)) {
					// pwd 도 같음 로그인 성공
					result = 0;
				} else {
					// pwd 가 틀림
					result = 1;
				}
			} else {
				// id없음
				System.out.println("ymkim" + 6);
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
			pstmt.setString(1, vo.getMember_id());
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
