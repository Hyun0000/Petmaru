package com.petmaru.notice.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.petmaru.common.DBCPTemplate;
import com.petmaru.notice.dao.NoticeDao;
import com.petmaru.notice.vo.NoticeVo;

public class NoticeService {
	public ArrayList<NoticeVo> getNoticeList(String field, String query, int page){
		ArrayList<NoticeVo> list = null;
		Connection conn = DBCPTemplate.getConnection();
		list = new NoticeDao().getNoticeList(field,query,page);
		DBCPTemplate.close(conn);
		return list;
	}
	
	public int getNoticeCount(String field, String query) {
		int count = 0;
		Connection conn = DBCPTemplate.getConnection();
		count = new NoticeDao().getNoticeCount(field,query);
		DBCPTemplate.close(conn);
		return count;
		
	}
	public NoticeVo getNotice(int id) {
		NoticeVo notice = null;
		Connection conn = DBCPTemplate.getConnection();
		notice = new NoticeDao().getNotice(id);
		DBCPTemplate.close(conn);
		return notice;
	}
	public NoticeVo getNextNotice(int id) {
		NoticeVo notice = null;
		Connection conn = DBCPTemplate.getConnection();
		notice = new NoticeDao().getNextNotice(id);
		DBCPTemplate.close(conn);
		return notice;
	}
	public NoticeVo getPrevNotice(int id) {
		NoticeVo notice = null;
		Connection conn = DBCPTemplate.getConnection();
		notice = new NoticeDao().getPrevNotice(id);
		DBCPTemplate.close(conn);
		return notice;
	}
	
}
