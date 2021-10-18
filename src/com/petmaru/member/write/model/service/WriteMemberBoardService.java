package com.petmaru.member.write.model.service;

import java.sql.Connection;

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
	
}
