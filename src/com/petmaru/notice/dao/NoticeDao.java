package com.petmaru.notice.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
			boolean pub = rs.getBoolean("PUB");
			
			NoticeVo notice = new NoticeVo(id, title, writerId, regdate, hit, files, content,pub);	
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
	public ArrayList<NoticeVo> getPubNoticeList(String field, String query, int page) {
		ArrayList<NoticeVo> list = new ArrayList<>();
		
		String sql = "SELECT * FROM ( " + 
				"    SELECT ROWNUM NUM, N.* " + 
				"    FROM (SELECT * FROM NOTICE WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) N" +
				")" + "WHERE PUB = 1 AND NUM BETWEEN ? AND ?";

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
			boolean pub = rs.getBoolean("PUB");
			
			NoticeVo notice = new NoticeVo(id, title, writerId, regdate, hit, files, content,pub);	
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
		
		String sql = "SELECT COUNT(id) COUNT FROM (" + 
				"    SELECT ROWNUM NUM, NOTICE.* " + 
				"    FROM NOTICE WHERE "+field+" LIKE ? ORDER BY REGDATE DESC " + 				
				"    ) " ;
		
		Connection conn = DBCPTemplate.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {			
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1,"%"+query+"%");		   
			rs = pstmt.executeQuery();
			
			if(rs.next())
			count =rs.getInt("count");
		
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
			boolean pub = rs.getBoolean("PUB");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content,pub);	
			
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
			boolean pub = rs.getBoolean("PUB");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content,pub);	
			
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
			boolean pub = rs.getBoolean("PUB");
			
			notice = new NoticeVo(nid, title, writerId, regdate, hit, files, content,pub);	
			
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
	
	public int deleteNoticeAll(int[] ids) {
		int result = 0;
		String params = "";
		
		for(int i=0; i<ids.length; i++) {
			params += ids[i];
			if( i < ids.length-1)
				params += ",";
		}
		String sql ="DELETE NOTICE WHERE ID IN ("+params+")";
		

		try {
			Connection conn = DBCPTemplate.getConnection();
			Statement st = conn.createStatement();
			result = st.executeUpdate(sql); 
			
			st.close();
			conn.close();	
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	  public int removeNoticeAll(int[] ids){
	      return 0;
	   }
	   public int pubNoticeAll(int[] ids){
	      return 0;
	   }
	   
	   public int insertNotice(NoticeVo notice){
			int result = 0;

			String sql ="INSERT INTO NOTICE (ID, TITLE, CONTENT, WRITER_ID, PUB, FILES) VALUES (600, ?, ?, ?, ?, ?)";
			
			try {
				Connection conn = DBCPTemplate.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				System.out.println("getTitle() : " + notice.getTitle());
				System.out.println("getContent() : " + notice.getContent());
				System.out.println("getWriterId() : " + notice.getWriterId());
				System.out.println("getPub() : " + notice.getPub());
				System.out.println("getFiles() : " + notice.getFiles());
				pstmt.setString(1, notice.getTitle());
				pstmt.setString(2, notice.getContent());
				pstmt.setString(3, notice.getWriterId());
				pstmt.setBoolean(4, notice.getPub());
				pstmt.setString(5, notice.getFiles());
				result = pstmt.executeUpdate(); 
				
				pstmt.close();
				conn.close();	
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return result;
	   }
	   
	   
	   public int pubNoticeAll(int[] oids, int[] cids) {
		   
		   List<String> oidsList = new ArrayList<>();
		   for(int i = 0; i<oids.length; i++)
			   oidsList.add(String.valueOf(oids[i]));
		
		   List<String> cidsList = new ArrayList<>();
		   for(int i = 0; i<cids.length; i++)
			   cidsList.add(String.valueOf(oids[i]));

		   return pubNoticeAll(oidsList,cidsList);
	   }

	   public int pubNoticeAll(List<String> oids, List<String> cids) {
		   
		   String oidsCSV= String.join(",", oids);
		   String cidsCSV= String.join(",", cids);
		   
		   return pubNoticeAll(oidsCSV,cidsCSV);
	   }
	   public int pubNoticeAll(String oidsCSV, String cidsCSV) {
		   int result = 0;
		   
		   String sqlOpen =String.format("UPDATE NOTICE SET PUB =1 WHERE ID IN (%s)", oidsCSV);
		   String sqlClose =String.format("UPDATE NOTICE SET PUB =0 WHERE ID IN (%s)",cidsCSV);
		   
			try {
				Connection conn = DBCPTemplate.getConnection();
				Statement stOpen = conn.createStatement();
				result +=stOpen.executeUpdate(sqlOpen);

				Statement stClose = conn.createStatement();
				result +=stClose.executeUpdate(sqlClose);
				
				stOpen.close();
				stClose.close();
				conn.close();	
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return result;

	   }
	   public int deleteNotice(int id){
	      return 0;
	   }
	   public int updateNotice(NoticeVo notice){
	      return 0;
	   }

}