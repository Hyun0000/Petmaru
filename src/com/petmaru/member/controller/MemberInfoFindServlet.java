package com.petmaru.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.service.MemberService;

/**
 * Servlet implementation class info_find
 */
@WebServlet("/infofind")
public class MemberInfoFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println("뽑아온 데이터" + id+ name);
		System.out.println("email" + email);
		MemberService service = new MemberService();
		String findid = service.findId(name, email);
		System.out.println("아디:" + findid);
		
		if(findid !=null) {
			System.out.println("서블릿 찾아온 아디:" + findid);
		} else
		{
			System.out.println("없음!");
		}
		
		request.setAttribute("findid", findid);
		request.getRequestDispatcher("/WEB-INF/member/info_find.jsp").forward(request, response);
	}
}