package com.petmaru.member.write.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.write.model.dao.WriteMemberBoardDao;
import com.petmaru.member.write.model.vo.WriteMemberBoardVo;

public class WriteMemberBoardService {
	
	public WriteMemberBoardService() {}
	
	public int boardwirte(WriteMemberBoardVo vo) {
		int result = -1;
		Connection conn = DBCPTemplate.getConnection();
		result = new WriteMemberBoardDao().boardwrite(conn, vo);
		DBCPTemplate.close(conn);
		return result;
	}
	
	public WriteMemberBoardVo getBoard(int bno) {
		WriteMemberBoardVo vo = null;
		Connection conn = DBCPTemplate.getConnection();
		vo = new WriteMemberBoardDao().getBoard(conn, bno);
		DBCPTemplate.close(conn);
		return vo;
	}
	
	public int getBoardCount(){
		int result = 0;
		Connection conn = DBCPTemplate.getConnection();
		result = new WriteMemberBoardDao().getBoardCount(conn);
		DBCPTemplate.close(conn);
		return result;
	}
	
	public ArrayList<WriteMemberBoardVo> selectBoardList(int start, int end){
		ArrayList<WriteMemberBoardVo> volist = null;
		Connection conn = DBCPTemplate.getConnection();
		
		volist = new WriteMemberBoardDao().selectBoardList(conn, start, end);
		
		DBCPTemplate.close(conn);
		return volist;
	}
	
	public int deleteBoard(int board_no) {
		int result = 0;
		Connection conn = DBCPTemplate.getConnection();
		result = new WriteMemberBoardDao().deleteBoard(conn, board_no);
		DBCPTemplate.close(conn);
		return result;
	}
	
	public int boardrewirte(WriteMemberBoardVo vo) {
		int result = 0;
		Connection conn = DBCPTemplate.getConnection();
		result = new WriteMemberBoardDao().reWriteBoard(conn, vo);
		DBCPTemplate.close(conn);
		return result;
	}
}
