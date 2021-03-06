package com.petmaru.member.write.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.petmaru.common.DBCPTemplate.*;
import com.petmaru.member.write.model.dao.WriteMemberReviewDao;
import com.petmaru.member.write.model.vo.WriteMemberReviewVo;

public class WriteMemberReviewService {
	//====================================================================================================
		// 각 상품 카테고리별 후기 조회(ajax)
		public ArrayList<WriteMemberReviewVo> productMemberReview(String category, int startRown, int endRown) {
			ArrayList<WriteMemberReviewVo> productMemberReview = null;
			Connection conn = getConnection();
			productMemberReview = new WriteMemberReviewDao().productMemberReview(conn, category, startRown, endRown);
			close(conn);
			return productMemberReview;
		}
	//====================================================================================================
		// 각 상품 카테고리 별 후기 글의 총 개수
		public int allReview(String cateGory) {
			int result = 0;
			Connection conn = getConnection();
			result = new WriteMemberReviewDao().allReview(conn, cateGory);
			close(conn);
			return result;
		}
	//====================================================================================================
		// 리뷰 글 삭제(ajax)
		public int writememberdelete(String title, String writer) {
			int result = 0;
			Connection conn = getConnection();
			result = new WriteMemberReviewDao().writememberDelete(conn, title, writer);
			close(conn);
			return result;
		}
	//====================================================================================================
		// 리뷰 글 수정(ajax)
		public int writeMemberUpdate(String title, String id, String upTitle, String content, String fileName) {
			int result = 0;
			Connection conn = getConnection();
			result = new WriteMemberReviewDao().writeMemberUpdate(conn, title, id, upTitle, content, fileName);
			close(conn);
			return result;
		}
	//====================================================================================================
		// 리뷰 글 등록
		public int writememberinsert(String category, int pno, String title, String content, String writer, String url) {
			int result = 0;
			Connection conn = getConnection();
			result = new WriteMemberReviewDao().writememberinsert(conn, category, pno, title, content, writer, url);
			close(conn);
			return result;
		}
	//====================================================================================================
		// 구매 후 해당 상품 리뷰 글 작성여부(ajax)
		public int writemembercheckwriter(String id, String category) {
			int result = -1;
			Connection conn = getConnection();
			result = new WriteMemberReviewDao().writemembercheckwriter(conn, id, category);
			close(conn);
			return result;
		}
	//====================================================================================================
	//====================================================================================================
	//====================================================================================================
	//====================================================================================================
}
