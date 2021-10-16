package com.petmaru.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;

/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/login.do")
public class MemberLoginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/member/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String id =request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
		// return : 1 - id,pwd 일치 / 0- id만일치 /  2- id없음 / -1 오류발생
				 int result = new MemberService().loginmember(id, pwd);
				 
				 if(result == 1) {
					// 로그인 성공시 회원 정보 전체 session 저장
					MemberVo memberVo = null;
					memberVo = new MemberService().memberSession(id);
					
					request.getSession().setAttribute("memberLoginInfo", id);
					request.getSession().setAttribute("memberVo", memberVo);
					request.getSession().setAttribute("memberSessionName", memberVo.getMember_name());
					request.getSession().setAttribute("memberSessionPhone", memberVo.getMember_phone());
					
					System.out.println("memberSession : " + memberVo);
					System.out.println("memberSessionName : " + memberVo.getMember_name());
					System.out.println("memberSessionPhone : " + memberVo.getMember_phone());
					System.out.println(id + "로그인 성공했다");
				 }else {
					System.out.println(result);
					System.out.println("아이디 또는 비밀번호가 잘못 입력되었습니다. 다시 확인해라");
				 }
				 //Member vo = new Member();
				// response.getWriter().append(vo.toString());
				 request.getRequestDispatcher("/WEB-INF/member/login.jsp").forward(request, response);
	}

}
