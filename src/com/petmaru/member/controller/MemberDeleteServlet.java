package com.petmaru.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/memberdelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/member/memberdelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String id = request.getParameter("deleteid");
		String pwd = request.getParameter("deletepwd");
		System.out.println("deleteid : " + id);
		System.out.println("deletepwd : " + pwd);

		// return : 1 - id,pwd 일치 / 0- id만일치 / 2- id없음 / -1 오류발생
		int result = new MemberService().loginmember(id, pwd);

		if (result == 1) {

			int deleteid = 0;
			System.out.println("deleteid : " + id);
			System.out.println("deletepwd : " + pwd);
			request.setAttribute("login", "1");
			deleteid = new MemberService().deleteMember(id);
			if (deleteid == 1) {
				System.out.println("삭제 완료");
				writer.println("<script>alert('탈퇴 완료.'); location.href='"+"/Petmaru/mainpage"+"';</script>");
				writer.close();	
				HttpSession session = request.getSession(false);
				// 만약 세션이 null이 아니라면 해당 세션을 만료 시켜 세션 정보를 없앤다.
				if(session != null) session.invalidate();
				response.sendRedirect("/Petmaru/mainpage");
			}

		} else {
			System.out.println(result);
			System.out.println("아이디 또는 비밀번호가 잘못 입력되었습니다. 다시 확인해라");
			writer.println("<script>alert('아이디 또는 비밀번호가 잘못 입력되었습니다. 다시 확인하세요.'); location.href='"+"/Petmaru/memberdelete"+"';</script>");
			writer.close();	
			System.out.println("login: 없음");
		}
		//request.getRequestDispatcher("/WEB-INF/member/memberdelete.jsp").forward(request, response);
	}

}
