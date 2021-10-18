package com.petmaru.notice.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.notice.vo.NoticeVo;


public class NoticeDao {
	
	public ArrayList<NoticeVo> getNoticeList(){
		return getNoticeList("title", "", 1);
	}
	public ArrayList<NoticeVo> getNoticeList(int page){
		return getNoticeList("title","",page);
	}
	public ArrayList<NoticeVo> getNoticeList(String field, String query, int page){
		
		ArrayList<NoticeVo> list = new ArrayList<>();
		
		String sql = "SELECT * FROM ( " + 
				"    SELECT ROWNUM NUM, N.* " + 
				"    FROM (SELECT * FROM NOTICE WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) N" +
				")" + "WHERE NUM BETWEEN ? AND ?";

		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {			
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1,"%"+query+"%");
		    pstmt.setInt(2, 1+(page-1)*10);
		    pstmt.setInt(3, page*10);
		    
			rs = pstmt.executeQuery();
			
			while(rs.next()){ 	
			int id = rs.getInt("ID");
			String title = rs.getString("TITLE");		
			String writerId = rs.getString("WRITER_ID"); 
			Date regdate = rs.getDate("REGDATE"); 	
			String hit = rs.getString("HIT"); 
			String files = rs.getString("FILES");
			String content = rs.getString("Content");
			
			NoticeVo notice = new NoticeVo(id, title, writerId, regdate, hit, files, content);	
			list.add(notice);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			    if(conn !=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}		
		
		}
		return list;
	}


	public int getNoticeCount() {
		return getNoticeCount("title", "");	
	}
	
	public int getNoticeCount(String field, String query) {
		
		int count = 0;
		
		String sql = "SELECT COUNT(Notice_id) COUNT FROM (" + 
				"    SELECT ROWNUM NUM, NOTICE.* " + 
				"    FROM NOTICE  WHERE "+field+" LIKE ? ORDER BY Notice_REGDATE DESC " + 				
				"    ) " ;
		
		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {			
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1,"%"+query+"%");		   
			rs = pstmt.executeQuery();
			rs.getInt("count");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			    if(conn !=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}			
		}		
		return count;	
	}	

	
	
	public NoticeVo getNotice(int id) {
		NoticeVo notice = null;
		String sql = "SELECT * FROM NOTICE WHERE ID =?";
		
		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
			
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){ 	
				
			int nid = rs.getInt("ID");
			String title = rs.getString("TITLE");		
			String writerId = rs.getString("WRITER_ID"); 
			Date regdate = rs.getDate("REGDATE"); 	
			String hit = rs.getString("HIT"); 
			String files = rs.getString("FILES");
			String content = rs.getString("Content");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content);	
			
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			    if(conn !=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}		
		
		}
		return notice;
	}
	
	public NoticeVo getNextNotice(int id) {
		NoticeVo notice = null;

		String sql ="SELECT * FROM NOTICE " + 
				"    WHERE ID = (  " + 
				"    SELECT ID FROM NOTICE " + 
				"    WHERE REGDATE >(SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				"    AND ROWNUM =1 " + 
				")";

		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
			
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){ 	
				
			int nid = rs.getInt("ID");
			String title = rs.getString("TITLE");		
			String writerId = rs.getString("WRITER_ID"); 
			Date regdate = rs.getDate("REGDATE"); 	
			String hit = rs.getString("HIT"); 
			String files = rs.getString("FILES");
			String content = rs.getString("Content");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content);	
			
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			    if(conn !=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}		
		
		}
		
		
		return notice;
	}
	public NoticeVo getPrevNotice(int id) {
		NoticeVo notice = null;
		String sql ="SELECT ID FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC)" + 
				"  WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				"  AND ROWNUM =1 ";

		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
		
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){ 	
				
			int nid = rs.getInt("ID");
			String title = rs.getString("TITLE");		
			String writerId = rs.getString("WRITER_ID"); 
			Date regdate = rs.getDate("REGDATE"); 	
			String hit = rs.getString("HIT"); 
			String files = rs.getString("FILES");
			String content = rs.getString("Content");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content);	
			
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
			    if(conn !=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}				
		}
		return notice;
	}	
}