package com.petmaru.member.write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.petmaru.member.write.model.service.WriteMemberReviewService;

/**
 * Servlet implementation class WriteMemberDeleteServlet
 */
@WebServlet("/writememberdelete")
public class WriteMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// WRITER & TITLE을 조건으로 받는다.
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		
		String titleStr = request.getParameter("title");
		String writerStr = request.getParameter("writer");
		String title = "";
		String writer = "";
		int result = 0;
		System.out.println("titleStr : " +titleStr);
		System.out.println("writerStr : " +writerStr);
		
		if (titleStr == null || titleStr.equals("")) { System.out.println("title 전송에 문제가 있다."); }
		else { title = titleStr; }
		System.out.println("title : " +title);
		
		if (writerStr == null || writerStr.equals("")) { System.out.println("id 전송에 문제가 있다."); }
		else { writer = writerStr; }
		System.out.println("writer : " +writer);
		
		result = new WriteMemberReviewService().writememberdelete(title, writer);
		System.out.println("result : " + result);
		
		String gsonStr = "";
		
		if (result != 1) { System.out.println("삭제가 정상적으로 되지 않았다."); }
		
		if (result == 1) {
			System.out.println("삭제 완료");
			jsonObject.put("result", result);
		} else {
			jsonObject.put("result", "false");
		}
		
		out.print(jsonObject.toJSONString());
		out.flush();
		out.close();
    }

}
