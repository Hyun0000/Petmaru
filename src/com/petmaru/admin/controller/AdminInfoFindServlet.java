package com.petmaru.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.service.MemberService;

/**
 * Servlet implementation class AdminInfoFindServlet
 */
@WebServlet("/admininfofind")
public class AdminInfoFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInfoFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/admininfofind.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println("아이디 찾기 뽑아온 데이터" + email+ name);
		System.out.println("비번찾기 뽑아온 데이터" + id+ email);
		MemberService service = new MemberService();
		
		
		if(id==null) {
			String findid = service.adminfindId(name, email);
		
			if(findid !=null) {
				System.out.println("서블릿 찾아온 아디:" + findid);
				request.setAttribute("searchId", findid);
			} else
			{
				System.out.println("아디없음!");
				request.setAttribute("searchId", "");
			}
		}
		if(name==null) {
			String findpwd = service.adminfindPwd(id, email);
			if(findpwd !=null) {
				System.out.println("서블릿 찾아온 비번:" + findpwd);
				request.setAttribute("searchPwd", findpwd);
			} else
		{
				System.out.println("비번없음!");
				request.setAttribute("searchPwd", "");
			}
		}
		request.getRequestDispatcher("/WEB-INF/admin/admininfofind.jsp").forward(request, response);
	}

}
