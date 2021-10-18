package com.petmaru.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.notice.dao.NoticeDao;
import com.petmaru.notice.vo.NoticeVo;


/**
 * Servlet implementation class NoticeListControllerServlet
 */
@WebServlet("/Noticelist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	       
//    	Connection conn = null;
//        //list?f=title&q=a
//        String field_ = request.getParameter("f");
//        String query_ = request.getParameter("q");
//        String page_ = request.getParameter("p");
//        
//        String field = "title";
//        if(field_ != null && !field_.equals(""))
//            field = field_;
//        
//        String query = "";
//        if(query_ != null && !query_.equals(""))
//            query = query_;        
//        
//        int page = 1;
//        if(page_ !=null && !page_.equals(""))
//            page = Integer.parseInt(page_);
//        
//        NoticeDao Dao = new NoticeDao(); 
//		ArrayList<NoticeVo> noticelist = Dao.getNoticeList(conn,field, query, page);
//        int count = Dao.getNoticeCount(conn, field, query);
//        System.out.println(count);
//        //검색어가 있을 경우엔 검색컬럼을 이용해서 데이터를 가져올 수 있도록    
//        
//        request.setAttribute("list", noticelist);
//        request.setAttribute("count", count);
//        request.getRequestDispatcher("WEB-INF/notice/Noticelist.jsp").forward(request, response); 
//    }
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");
		
		String field = "title";
		if(field_ != null && !field_.equals(""))
			field = field_;
		
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		
		int page = 1;
		if(page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);				
		
		NoticeDao dao = new NoticeDao(); 
		ArrayList<NoticeVo> list= dao.getNoticeList(field, query, page);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/notice/Noticelist.jsp").forward(request, response);	
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
