package com.petmaru.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
@WebServlet("/adminNoticelist")
public class AdminNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String[] openIds = request.getParameterValues("open-id");
		String[] delIds = request.getParameterValues("del-id");
		String cmd = request.getParameter("cmd");	
		String ids_ = request.getParameter("ids");
		String[] ids = ids_.trim().split(" ");
		
		NoticeService service = new NoticeService();
		NoticeDao dao = new NoticeDao();
		switch(cmd) {
		case "일괄공개":
			for(String openId : openIds)
				System.out.printf("open id : %s\n", openId);
			
		List<String> oids = Arrays.asList(openIds);
		
		List<String> cids = new ArrayList(Arrays.asList(ids));
		cids.removeAll(oids);
		System.out.println(Arrays.asList(ids));
		System.out.println(oids);
		System.out.println(cids);
		
			
		// Transaction 처리
		dao.pubNoticeAll(oids,cids); // UPDATE NOTICE SET PUB=1 WHERE ID IN(...):

			
			break;
			
			
		case "일괄삭제":
			
			int[] ids1 = new int[delIds.length];
			for(int i=0; i<delIds.length; i++)
				ids1[i] = Integer.parseInt(delIds[i]);
			
			int result = service.deleteNoticeAll(ids1);
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
		ArrayList<NoticeVo> list = service.getNoticeList(field, query, page);
		int count = service.getNoticeCount(field, query);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/admin/adminNoticelist.jsp").forward(request, response);
	}

}