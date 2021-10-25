package com.petmaru.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberjoin")
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
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/member/memberjoin.jsp");
		rd.forward(request, response);
		
//		String id =request.getParameter("id");
//		String pwd1 = request.getParameter("pwd1");
//		String pwd2 = request.getParameter("pwd2");
//		String email = request.getParameter("email");
//		String name = request.getParameter("name");
//		String phone1 = request.getParameter("phone1"); 
//		String phone2 = request.getParameter("phone2");
//		String phone3 = request.getParameter("phone3");
//		String address = request.getParameter("add");
//		char gender = request.getParameter("gender_value").charAt(0);
//		int point = 0;
//		String birth1 = request.getParameter("birth1");
//		String month = request.getParameter("month");
//		String birth2 = request.getParameter("birth2");	
//		String pwd = null;
//
//		
//		if(pwd1==pwd2) {
//			pwd = pwd1;
//		}
//		
//		String phone = phone1 + phone2 + phone3 ;
//		String birth = birth1 + month + birth2;
//
//		// 화면 데이터를 vo에 싣기
//				Member vo = new Member(id,name,pwd,phone,address,null,gender,point,email);
//		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
//				 int result = new MemberService().insertMember(vo);
//				 System.out.println(result);
//				 if(result ==  1 ) {
//						System.out.println(id+"님 가입되었습니다. 환영합니다.");
//						//out.println(id+"님 가입되었습니다. 환영합니다.");
//					} else if(result == 2) {
//						System.out.println("기존회원 id가 존재합니다. ");
//					} else {  // 오류발생:-1,그외 등등, 가입실패:0
//						System.out.println("예기치 못한 오류 발생. 다시 시도해 주세요. ");
//					}	
//		String id =request.getParameter("id");
//		String name = request.getParameter("name");
//		String pwd = request.getParameter("pwd");
//		String phone = request.getParameter("phone");
//		String address = request.getParameter("address");
//		char gender = request.getParameter("gender").charAt(0);
//		int point = 0;
//		String email = request.getParameter("email");
//		PrintWriter out = response.getWriter();

	
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter writer = response.getWriter();
    	String id =request.getParameter("id");
		String pwd = request.getParameter("pwd1");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1"); 
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String address = request.getParameter("add");
		String gender = request.getParameter("gender");
		int point = 10000;
		String birth1 = request.getParameter("birth1");
		String month = request.getParameter("month");
		String birth2 = request.getParameter("birth2");	
		
		
		String phone = phone1 + phone2 + phone3 ;
		String birth = birth1 + month + birth2;
		// 화면 데이터를 vo에 싣기
		MemberVo vo = new MemberVo(id,name,pwd,phone,address,gender,point,email);
		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
				 int result = new MemberService().insertMember(vo);
				 System.out.println("servlet: "+ vo);
				 System.out.println(result);
				 if(result ==  1 ) {
						System.out.println(id+"님 가입되었습니다. 환영합니다.");
						writer.println("<script>alert('회원가입 완료'); location.href='"+"/Petmaru/mainpage"+"';</script>");
						writer.close();	
						//out.println(id+"님 가입되었습니다. 환영합니다.");
						//response.sendRedirect("/Petmaru/mainpage");
					} else if(result == 2) {
						System.out.println("기존회원 id가 존재합니다. ");
						writer.println("<script>alert('기존회원 id가 존재합니다. '); location.href='"+"/Petmaru/memberjoin"+"';</script>");
						writer.close();	
						//response.sendRedirect("/Petmaru/memberjoin");
						//request.setAttribute("check", "");
					} else {  // 오류발생:-1,그외 등등, 가입실패:0
						System.out.println("예기치 못한 오류 발생. 다시 시도해 주세요. ");
						response.sendRedirect("/Petmaru/memberjoin");
					}	
//				 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/member/memberjoin.jsp");
//				 rd.forward(request, response);
	}

}
