package com.petmaru.member.write.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.write.model.vo.WriteMemberBoardVo;

public class WriteMemberBoardDao {
	private Connection conn;
	private ResultSet rset;
	
//	public WriteMemberBoardVo boardList(Connection conn, int board_no) {
//		WriteMemberBoardVo vo = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String sql = "SELECT BOARD_TITLE, BOARD_WRITER, BOARD_DATE FROM BOARD WHERE BOARD_NO = ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, board_no);
//			rset = pstmt.executeQuery();
//			if (rset.next()) {
//				vo = new WriteMemberBoardVo();
//				vo.setBoard_title(rset.getString("BOARD_TITLE"));
//				vo.setBoard_writer(rset.getString("BOARD_WRITER"));
//				vo.setBoard_date(rset.getDate("BOARD_DATE"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBCPTemplate.close(rset);
//			DBCPTemplate.close(pstmt);
//		}
//		return vo;
//	}
	
	public int boardwrite(Connection conn, WriteMemberBoardVo vo) {
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "INSERT INTO BOARD"
				+ "(board_no, board_title, board_content, board_writer)"
				+ "VALUES (seq_board.NEXTVAL, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBoard_title());
			pstmt.setString(2, vo .getBoard_content());
			pstmt.setString(3, vo.getBoard_writer());
			rset = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}


