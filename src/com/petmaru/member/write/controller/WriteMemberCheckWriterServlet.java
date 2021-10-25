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
 * Servlet implementation class WriteMemberCheckWriterServlet
 */
@WebServlet("/writemembercheckwriter")
public class WriteMemberCheckWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberCheckWriterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// 조건은 id와 category
		
		// 1. id 받기
		String idStr = request.getParameter("userId");
		String id = "";
		if (idStr == null || idStr.equals("")) { System.out.println("id 전달이 제대로 되지 않았다."); }
		else { id = idStr; }
		
		// 2. category 받기
		String categoryStr = request.getParameter("category");
		String category = "";
		if (categoryStr == null || categoryStr.equals("")) { System.out.println("category 전달이 제대로 되지 않았다."); }
		else { category = categoryStr; }
		
		// result = 1 --> 구매를 했으며 이미 후기를 작성
		// result = 0 --> 구매는 했지만 후기룰 작성하지 않았다.
		int result = -1;
		result = new WriteMemberReviewService().writemembercheckwriter(id, category);
		
		JSONObject jsonObject = null;
		
		if (result == 1) {
			// result = 1 --> 구매를 했으며 이미 후기를 작성
			jsonObject = new JSONObject();
			jsonObject.put("result", result);
			System.out.println("구매를 했으며 이미 후기를 작성");
		} else if(result == 0) {
			// result = 0 --> 구매는 했지만 후기룰 작성하지 않았다.
			jsonObject = new JSONObject();
			jsonObject.put("result", result);
			System.out.println("후기를 작성하지 않았다.");
		} else {
			System.out.println("DB 조회 중 문제 발생");
		}
		out.print(jsonObject.toJSONString());
		out.flush();
		out.close();
	}
}
