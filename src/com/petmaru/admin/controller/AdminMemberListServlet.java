package com.petmaru.admin.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class AdminPageServlet
 */
@WebServlet(name = "MemberList", urlPatterns = { "/MemberList" })
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		MemberVo m = (MemberVo)session.getAttribute("member");
		String memberId = m.getMember_id();
		
		if(memberId.equals("admin")) {
			MemberService service = new MemberService();
			ArrayList<MemberVo> list = service.selectList();
			
			request.setAttribute("members", list);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Member/MemberList.jsp");
			rd.forward(request, response);
		}
		
	}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
