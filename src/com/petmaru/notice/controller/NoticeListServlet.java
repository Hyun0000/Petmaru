package com.petmaru.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.notice.dao.NoticeDao;
import com.petmaru.notice.service.NoticeService;
import com.petmaru.notice.vo.NoticeVo;

/**
 * Servlet implementation class NoticeListControllerServlet
 */
@WebServlet("/Noticelist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String[] openIds = request.getParameterValues("open-id");
		String[] delIds = request.getParameterValues("del-id");
		String cmd = request.getParameter("cmd");	
		
		switch(cmd) {
		case "일괄공개":
			for(String openId : openIds)
				System.out.printf("open id : %s\n", openId);
			break;
		case "일괄삭제":
			NoticeService service = new NoticeService();
			int[] ids = new int[delIds.length];
			for(int i=0; i<delIds.length; i++)
				ids[i] = Integer.parseInt(delIds[i]);
			
			int result = service.deleteNoticeAll(ids);
			break;
		}
		
		response.sendRedirect("adminNoticelist");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");

		String field = "title";
		if (field_ != null && !field_.equals(""))
			field = field_;

		String query = "";
		if (query_ != null && !query_.equals(""))
			query = query_;

		int page = 1;
		if (page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);

		NoticeService service = new NoticeService();
		ArrayList<NoticeVo> list = service.getPubNoticeList(field, query, page);
		int count = service.getNoticeCount(field, query);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/notice/Noticelist.jsp").forward(request, response);
	}
}