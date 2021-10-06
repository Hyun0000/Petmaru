package com.petmaru.member.write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.vo.Member;
import com.petmaru.product.member.model.service.MemberService;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/MemberJoinServlet")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");

		String id =request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		char gender = request.getParameter("gender").charAt(0);
		int point = Integer.parseInt(request.getParameter("point"));
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		
		
		// 화면 데이터를 vo에 싣기
				Member vo = new Member(id,name,pwd,phone,address,null,gender,point,email);
		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
				 int result = new MemberService().insertMember(vo);
				 System.out.println(result);
				 if(result ==  1 ) {
						System.out.println(id+"님 가입되었습니다. 환영합니다.");
						//out.println(id+"님 가입되었습니다. 환영합니다.");
					} else if(result == 2) {
						System.out.println("기존회원 id가 존재합니다. ");
					} else {  // 오류발생:-1,그외 등등, 가입실패:0
						System.out.println("예기치 못한 오류 발생. 다시 시도해 주세요. ");
					}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
