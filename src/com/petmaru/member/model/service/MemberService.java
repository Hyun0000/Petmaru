package com.petmaru.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petmaru.admin.model.vo.AdminVo;
import com.petmaru.common.DBCPTemplate;
import com.petmaru.member.model.dao.MemberDao;
import com.petmaru.member.model.vo.MemberVo;

public class MemberService {

	public MemberService() {
		
	}

	
	public int insertMember(MemberVo vo) {
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
	
	//관리자 등록
	public int insertMember(AdminVo vo) {
		int result =-1;
		int result2 = -1;
		Connection conn = DBCPTemplate.getConnection();
		DBCPTemplate.setAutoCommit(conn, false);
		//System.out.println("ymkim" +vo );	
		// 기존회원이 있으면:2, 없으면 : 0, 오류발생하면 :-1
		result = new MemberDao().checkDuplicatedAdmin(conn, vo);
		//System.out.println(result);
		if(result == 0) {  

			result = new MemberDao().insertAdmin(conn, vo);
			
			if(result > 0 && result2 > 0)
				DBCPTemplate.commit(conn);
			else
				DBCPTemplate.rollBack(conn);
		}
		DBCPTemplate.close(conn);
		return result;// 오류발생:-1, 가입성공:1, 가입실패:0, 기존회원있으면:2,가장큰수0xFF
	}
	
	//회원 리스트출력
	public ArrayList<MemberVo> getMemberList(String field, String query, int page) {
		ArrayList<MemberVo> list = null;
		Connection conn = DBCPTemplate.getConnection();
		list = new MemberDao().getMemberList(field, query, page);
		DBCPTemplate.close(conn);
		return list;
	}
	
	//회원 수 카운트
	public int getMemberCount(String field, String query) {
		int count = 0;
		Connection conn = DBCPTemplate.getConnection();
		count = new MemberDao().getMemberCount(field, query);
		DBCPTemplate.close(conn);
		return count;

	}
	
	// 회원 전체
	public MemberVo getMembers(String memberid) {
		MemberVo list = null;
		Connection conn = DBCPTemplate.getConnection();
		list = new MemberDao().getMember(memberid);
		DBCPTemplate.close(conn);
		return list;
	}
	
	
	public MemberVo getNextMember(String memberid) {
		MemberVo member = null;
		Connection conn = DBCPTemplate.getConnection();
		member = new MemberDao().getNextMember(memberid);
		DBCPTemplate.close(conn);
		return member;
	}
	
	public MemberVo getPrevMember(String memberid) {
		MemberVo member = null;
		Connection conn = DBCPTemplate.getConnection();
		member = new MemberDao().getPrevMember(memberid);
		DBCPTemplate.close(conn);
		return member;
	}
    //회원탈퇴
	public int deleteMember(String id) {
		Connection conn = DBCPTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.deleteMember(conn, id);
		
		if(result>0) {
			DBCPTemplate.commit(conn);
		}else {
			DBCPTemplate.rollBack(conn);
		}
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
	public int loginadmin(String id, String pwd) { //관리자 로그인
		int result = -1;
		Connection conn = DBCPTemplate.getConnection();		
		result = new MemberDao().loginadmin(conn, id, pwd);
		DBCPTemplate.close(conn);
		return result;
	}
	
	public String findId(String name, String email) { //아이디찾기
		String result = null;
		Connection conn = DBCPTemplate.getConnection();		
		result = new MemberDao().findId(conn, name, email);
		DBCPTemplate.close(conn);
		return result;
	
	}
	
	public String findPwd(String id, String email) { //비밀번호찾기
		String result = null;
		Connection conn = DBCPTemplate.getConnection();		
		result = new MemberDao().findPwd(conn, id, email);
		DBCPTemplate.close(conn);
		return result;
	
	}
	//===============================================================================================	
		// 로그인 성공시 회원 정보 전체 session 저장
		public MemberVo memberSession(String id) {
			MemberVo memberVo = null;
			Connection conn = DBCPTemplate.getConnection();
			memberVo = new MemberDao().loginmember(conn, id);
			DBCPTemplate.close(conn);
			return memberVo;
		}
		
		//관리자 로그인
		public AdminVo adminSession(String id) {
			AdminVo adminVo = null;
			Connection conn = DBCPTemplate.getConnection();
			adminVo = new MemberDao().loginadmin(conn, id);
			DBCPTemplate.close(conn);
			return adminVo;
		}
		
		//회원 정보 수정
		public int updateMember(String id,String name, String pwd, String phone,String address,String gender,int point,String email) {
			int result = -1;
		   System.out.println("service  "+ id+ name + pwd+ phone+  address+ gender+ point+email);
			Connection conn = DBCPTemplate.getConnection();
			result = new MemberDao().updateMember(conn, id,name,pwd, phone, address, gender, point,email);
			DBCPTemplate.close(conn);
			return result;
		}
		//관리자  정보 수정
		public int updateAdmin(String id,String name, String pwd, String phone,String email) {
			int result = -1;
		   System.out.println("service  "+ id+ name + pwd+ phone+email);
			Connection conn = DBCPTemplate.getConnection();
			result = new MemberDao().updateAdmin(conn, id,name,pwd, phone,email);
			DBCPTemplate.close(conn);
			return result;
		}
		
		public MemberVo getMember(String id) { //수정한 정보 가져오기
			MemberVo memberVo = null;
		   System.out.println("service  "+ id);
			Connection conn = DBCPTemplate.getConnection();
			memberVo = new MemberDao().getMember(conn, id);
			DBCPTemplate.close(conn);
			return memberVo;
		}
		public AdminVo getAdmin(String id) { //수정한 정보 가져오기
			AdminVo adminVo = null;
		   System.out.println("service  "+ id);
			Connection conn = DBCPTemplate.getConnection();
			adminVo = new MemberDao().getAdmin(conn, id);
			DBCPTemplate.close(conn);
			return adminVo;
		}
}
