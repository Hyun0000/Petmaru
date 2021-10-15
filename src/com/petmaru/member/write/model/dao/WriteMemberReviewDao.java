package com.petmaru.member.write.model.dao;


import static com.petmaru.common.DBCPTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.petmaru.member.write.model.vo.WriteMemberReviewVo;
public class WriteMemberReviewDao {
	//====================================================================================================
		// 각 상품 카테고리별 후기 조회(ajax)
		public ArrayList<WriteMemberReviewVo> productMemberReview(Connection conn, String category, int startRown, int endRown) {
			ArrayList<WriteMemberReviewVo> productMemberReview = null;
			WriteMemberReviewVo writeMemberReviewVo = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM ( select ROWNUM ROWN, R.* from (select * from REVIEW where REVIEW_PRODUCT_CATEGORY = ? order by REVIEW_NO desc) R) WHERE ROWN BETWEEN ? AND ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRown);
				pstmt.setInt(3, endRown);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					productMemberReview = new ArrayList<WriteMemberReviewVo>();
					do {
						writeMemberReviewVo = new WriteMemberReviewVo();
						writeMemberReviewVo.setReviewTitle(rs.getString("REVIEW_TITLE"));
						writeMemberReviewVo.setReviewContent(rs.getString("REVIEW_CONTENT"));
						writeMemberReviewVo.setReviewWriter(rs.getString("REVIEW_WRITER"));
						writeMemberReviewVo.setReviewDate(rs.getString("REVIEW_DATE"));
						writeMemberReviewVo.setReviewImageUrl(rs.getString("REVIEW_IMAGE_URL"));
						productMemberReview.add(writeMemberReviewVo);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return productMemberReview;
		}
	//====================================================================================================
		// 각 상품 카테고리 별 후기 글의 총 개수
		public int allReview(Connection conn, String cateGory) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select count(REVIEW_NO) from REVIEW where REVIEW_PRODUCT_CATEGORY = ?";
			
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
	//====================================================================================================
		// 리뷰 글 삭제(ajax)
		public int writememberDelete(Connection conn, String title, String writer) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = "delete from REVIEW where REVIEW_TITLE = ? and REVIEW_WRITER = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, writer);
				System.out.println("title : " + title);
				System.out.println("writer : " + writer);
				
				result = pstmt.executeUpdate();
				if (result == 1) { System.out.println("삭제 완료"); }
				else { System.out.println("삭제 실패"); }
				System.out.println(result);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	//====================================================================================================
		// 리뷰 글 수정(ajax)
		public int writeMemberUpdate(Connection conn, String title, String id, String upTitle, String content) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = "update REVIEW set REVIEW_TITLE = ?, REVIEW_CONTENT = ? where REVIEW_WRITER = ? and REVIEW_TITLE = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, upTitle);
				pstmt.setString(2, content);
				pstmt.setString(3, id);
				pstmt.setString(4, title);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println("result : " + result);
			return result;
		}
	//====================================================================================================
	//====================================================================================================
	//====================================================================================================
	//====================================================================================================
	//====================================================================================================
}
