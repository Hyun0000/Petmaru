package com.petmaru.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.admin.model.vo.AdminVo;
import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;

/**
 * Servlet implementation class AdminJoinServlet
 */
@WebServlet("/adminjoin")
public class AdminJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/adminjoin.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	String id =request.getParameter("id");
		String pwd = request.getParameter("pwd1");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1"); 
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		
		
		String phone = phone1 + phone2 + phone3 ;
		// 화면 데이터를 vo에 싣기
		AdminVo vo = new AdminVo(id,pwd,email,name,phone);
		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
				 int result = new MemberService().insertMember(vo);
				 System.out.println("servlet: "+ vo);
				 System.out.println(result);
				 if(result ==  1 ) {
						System.out.println(id+"님 가입되었습니다. 환영합니다.");
						//out.println(id+"님 가입되었습니다. 환영합니다.");
						response.sendRedirect("/Petmaru/AdminMainpage");
					} else if(result == 2) {
						System.out.println("기존회원 id가 존재합니다. ");
						response.sendRedirect("/Petmaru/adminjoin");
						request.setAttribute("check", "");
					} else {  // 오류발생:-1,그외 등등, 가입실패:0
						System.out.println("예기치 못한 오류 발생. 다시 시도해 주세요. ");
						response.sendRedirect("/Petmaru/adminjoin");
					}	
//				 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/member/memberjoin.jsp");
//				 rd.forward(request, response);
	}

	

}
