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
			System.out.println("dao : " + productMemberReview);
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
		public int writeMemberUpdate(Connection conn, String title, String id, String upTitle, String content, String fileName) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = "";
			if (fileName.endsWith("-")) {
				// 파일 수정없이 제목 & 내용만 수정
				sql = "update REVIEW set REVIEW_TITLE = ?, REVIEW_CONTENT = ? where REVIEW_WRITER = ? and REVIEW_TITLE = ?";
			} else {
				// 파일까지 함께 수정
				sql = "update REVIEW set REVIEW_TITLE = ?, REVIEW_CONTENT = ?, REVIEW_IMAGE_URL = ? where REVIEW_WRITER = ? and REVIEW_TITLE = ?";
			}
			try {
				pstmt = conn.prepareStatement(sql);
				if (fileName.endsWith("-")) {
					System.out.println("dao : 제목이랑 내용만 수정");
					pstmt.setString(1, upTitle);
					pstmt.setString(2, content);
					pstmt.setString(3, id);
					pstmt.setString(4, title);
				} else {
					System.out.println("dao : 파일까지 모두 수정");
					pstmt.setString(1, upTitle);
					pstmt.setString(2, content);
					pstmt.setString(3, fileName);
					pstmt.setString(4, id);
					pstmt.setString(5, title);
				}
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
		// 리뷰 글 등록
		public int writememberinsert(Connection conn, String category, int pno, String title, String content, String writer, String url) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO REVIEW VALUES (REVIEW_SEQUENCE.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, 'Y', ?)";
//		    REVIEW_NO NUMBER CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
			
//		    REVIEW_PRODUCT_CATEGORY CHAR(1) CONSTRAINT REVIEW_PRODUCT_CATEGORY_CK CHECK(REVIEW_PRODUCT_CATEGORY IN ('C', 'A', 'T', 'H', 'B', 'F')),
			
//		    REVIEW_PRODUCT_NO NUMBER CONSTRAINT REVIEW_PRODUCT_NO_FK REFERENCES PRODUCT(PRODUCT_NO),
			
//		   	REVIEW_TITLE VARCHAR2(300) CONSTRAINT REVIEW_TITLE_NN NOT NULL,
			
//		    REVIEW_CONTENT VARCHAR2(2000) CONSTRAINT REVIEW_CONTENT_NN NOT NULL,
			
//			REVIEW_DATE TIMESTAMP DEFAULT SYSDATE,
			
//			REVIEW_WRITER VARCHAR2(500) CONSTRAINT REVIEW_WRITER_FK REFERENCES MEMBER(MEMBER_ID),
			
//		    REVIEW_BUY CHAR(1) CONSTRAINT REVIEW_BUY_CK CHECK(REVIEW_BUY IN('Y','N')),
//		    REVIEW_IMAGE_URL VARCHAR2(500) CONSTRAINT REVIEW_IMAGE_URL_UK UNIQUE
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, pno);
				pstmt.setString(3, title);
				pstmt.setString(4, content);
				pstmt.setString(5, writer);
				pstmt.setString(6, url);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	//====================================================================================================
		// 구매 후 해당 상품 리뷰 글 작성여부(ajax)
		public int writemembercheckwriter(Connection conn, String id, String category) {
			int result = -1;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// SELECT REVIEW_WRITER FROM REVIEW WHERE REVIEW_WRITER = 'user01' AND REVIEW_PRODUCT_CATEGORY = 'C';
			String sql = "SELECT REVIEW_WRITER FROM REVIEW WHERE REVIEW_WRITER = ? AND REVIEW_PRODUCT_CATEGORY = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, category);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					// 구매를 했으며 이미 후기를 작성
					result = 1;
				} else {
					// 구매는 했지만 후기룰 작성하지 않았다.
					result = 0;
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
	//====================================================================================================
	//====================================================================================================
		}
