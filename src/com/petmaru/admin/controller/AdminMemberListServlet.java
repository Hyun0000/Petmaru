package com.petmaru.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;
import com.petmaru.notice.service.NoticeService;
import com.petmaru.notice.vo.NoticeVo;

/**
 * Servlet implementation class AdminPageServlet
 */
@WebServlet("/MemberList")

public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");

		String field = "member_name";
		if (field_ != null && !field_.equals(""))
			field = field_;

		String query = "";
		if (query_ != null && !query_.equals(""))
			query = query_;

		int page = 1;
		if (page_ != null && !page_.equals(""))
			page = Integer.parseInt(page_);

		MemberService service = new MemberService();
		ArrayList<MemberVo> list = service.getMemberList(field, query, page);
		int count = service.getMemberCount(field, query);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/member/MemberList.jsp").forward(request, response);
	}

//	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
