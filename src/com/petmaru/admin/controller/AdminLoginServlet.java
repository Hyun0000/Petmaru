package com.petmaru.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.petmaru.admin.model.vo.AdminVo;
import com.petmaru.member.model.service.MemberService;
import com.petmaru.member.model.vo.MemberVo;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminlogin.do")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/admin/adminlogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");
		request.setCharacterEncoding("UTF-8");
		JSONObject json = new JSONObject();
		
		
		String id =request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("관리자id : " + id);
		System.out.println("관리자pwd : " + pwd);
		
		//http://localhost:8090/Petmaru/Loginservlet?id=kim9140&pwd=1234
		// return : 1 - id,pwd 일치 / 0- id만일치 /  2- id없음 / -1 오류발생
				 int result = new MemberService().loginadmin(id, pwd);
				 
				 if(result == 1) {
					// 로그인 성공시 회원 정보 전체 session 저장
					AdminVo adminVo = null;
					adminVo = new MemberService().adminSession(id);
					
					request.getSession().setAttribute("adminLoginInfo", id);
					request.getSession().setAttribute("adminVo", adminVo);
					request.getSession().setAttribute("adminSessionName", adminVo.getAdmin_name());
					request.getSession().setAttribute("adminSessionPhone", adminVo.getAdmin_phone());
					json.put("result","ok");
					json.put("name", adminVo);
					
					System.out.println("adminSession : " + adminVo);
					System.out.println("adminSessionName : " + adminVo.getAdmin_name());
					System.out.println("adminSessionPhone : " + adminVo.getAdmin_phone());
					System.out.println(id + "로그인 성공했다");
					response.sendRedirect("/Petmaru/AdminMainpage");
					// request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
				 }else {
					System.out.println(result);
					System.out.println("아이디 또는 비밀번호가 잘못 입력되었습니다. 다시 확인해라");
					request.setAttribute("login","");
					System.out.println("login: 없음");
					json.put("result","fail");
					request.getRequestDispatcher("/WEB-INF/admin/adminlogin.jsp").forward(request, response);
				 }
	}

}
