package com.petmaru.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.service.MemberService;

/**
 * Servlet implementation class AdminMypageServlet
 */
@WebServlet("/adminmypage")
public class AdminMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/admin/admininfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");		
		MemberService service = new MemberService();
		//MemberVo m = new MemberVo(id,name,pwd, phone, address, gender, point,email);
		System.out.println("받아온 데이타들 " + id + email+ pwd );
		if(id!= null) {	
		int update = service.updateAdmin(id,name,pwd, phone,email);
		System.out.println("변경하러감");
		System.out.println("회원정보 수정입력후 받아온 데이터" + update);
		}
		request.getRequestDispatcher("/WEB-INF/admin/admininfo.jsp").forward(request, response);
	}

}
