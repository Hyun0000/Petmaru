package com.petmaru.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.notice.dao.NoticeDao;
import com.petmaru.notice.vo.NoticeVo;



/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		int Notice_no = Integer.parseInt(request.getParameter("member_id"));
//		NoticeService service = new NoticeService();	
//		
//		service.NoticeDetail(Notice_no);
//		request.getRequestDispatcher("/WEB-INF/member/NoticeList.jsp").forward(request, response);
//	}
		int id = Integer.parseInt(request.getParameter("id")); 
		
		NoticeDao dao = new NoticeDao();
		NoticeVo notice = dao.getNotice(id);
		request.setAttribute("n",notice);

		request.getRequestDispatcher("WEB-INF/notice/NoticeDetail.jsp").forward(request, response);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}