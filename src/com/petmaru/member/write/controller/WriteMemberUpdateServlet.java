package com.petmaru.member.write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petmaru.member.write.model.service.WriteMemberReviewService;

/**
 * Servlet implementation class WriteMemberUpdateServlet
 */
@WebServlet("/writememberupdate")
public class WriteMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=UTF-8");
		
		// 제목과 내용만 수정가능(사진 업로드는 추후에 결정)
		// 1. 제목
		String titleStr = request.getParameter("title");
		String title = "";
		if (titleStr == null || titleStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { title = titleStr; }

		// 2. 내용
		String contentStr = request.getParameter("content");
		String content = "";
		if (contentStr == null || contentStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { content = contentStr; }
		
		// sql에서 where문의 조건은 title & userId로 한다.
		// 3. 아이디 (조건)
		String idStr = request.getParameter("id");
		String id = "";
		if (idStr == null || idStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { id = idStr; }
		
		System.out.println("titleStr : " + titleStr);
		System.out.println("title : " + title);
		System.out.println("contentStr : " + contentStr);
		System.out.println("content : " + content);
		System.out.println("idStr : " + idStr);
		System.out.println("id : " + id);
		
		int result = 0;
		result = new WriteMemberReviewService().writeMemberUpdate(title, content, id);
		
		if (result == 0) {
			System.out.println("수정이 정상적으로 되지 않았습니다.");
		} else {
			Gson gson = new Gson();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
