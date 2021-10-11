package com.petmaru.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.model.dao.MemberDao;
import com.petmaru.member.model.vo.Member;

public class MemberService {

	public MemberService() {
		
	}

	
	public int insertMember(Member vo) {
		int result =-1;
		int result2 = -1;
		Connection conn = DBCPTemplate.getConnection();
		DBCPTemplate.setAutoCommit(conn, false);
		//System.out.println("ymkim" +vo );	
		// 기존회원이 있으면:2, 없으면 : 0, 오류발생하면 :-1
		result = new MemberDao().checkDuplicatedMember(conn, vo);
		//System.out.println(result);
		if(result == 0) {  

			result = new MemberDao().insertMember(conn, vo);
			
			if(result > 0 && result2 > 0)
				DBCPTemplate.commit(conn);
			else
				DBCPTemplate.rollBack(conn);
		}
		DBCPTemplate.close(conn);
		return result;// 오류발생:-1, 가입성공:1, 가입실패:0, 기존회원있으면:2,가장큰수0xFF
	}
	
	public ArrayList<Member> MemberAllList(int start, int end){
		ArrayList<Member> volist = null;
		Connection conn = DBCPTemplate.getConnection();
		
		volist = new MemberDao().MemberListAll(conn, start, end);
		
		DBCPTemplate.close(conn);
		return volist;
	}
	
	public int getMemberCount(){
		int result = 0;
		Connection conn = DBCPTemplate.getConnection();
		result = new MemberDao().getMemberCount(conn);
		DBCPTemplate.close(conn);
		return result;
	}
	
	public int loginmember(String id, String pwd) { //로그인
		int result = -1;
		Connection conn = DBCPTemplate.getConnection();		
		result = new MemberDao().loginmember(conn, id, pwd);
		DBCPTemplate.close(conn);
		return result;
	}
	
}