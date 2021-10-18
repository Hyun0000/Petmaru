package com.petmaru.member.write.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.petmaru.member.write.model.service.WriteMemberReviewService;
import com.petmaru.member.write.model.vo.WriteMemberReviewVo;

/**
 * Servlet implementation class WriteMemberReviewViewServlet
 */
@WebServlet("/writememberreviewview")
public class WriteMemberReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberReviewViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax 연결 성공");
		
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// 상품 카테고리 가져오기
		String cateGory = request.getParameter("cateGory"); // 상품 정보 & 후기 모두에 쓰일 변수
		System.out.println(cateGory);
		
		// 후기 목록 페이징
		final int PAGE_SIZE = 5; // 한 화면에 보여질 후기 글 개수
		final int PAGE_LINK = 5; // 한 페이지에 보여질 페이지 링크 (5개씩 보여진다.)  exX) (1 2 3 4 5)
		
		// 사용자 선택 리뷰 페이지 링크 번호
		String selectPageStr = request.getParameter("reviewpage");
		System.out.println("selectPageStr : " + selectPageStr);
		int selectPage = 1;
		
		// selectPageStr가 null 일 때 selectPage을 기본값(1)로 설정 
		if (selectPageStr == null || selectPageStr.equals("")) { System.out.println("null이다."); selectPage = 1; }
		else { selectPage = Integer.parseInt(selectPageStr); }
		System.out.println("selectPage : " + selectPage);
		
		// rownum 숫자
		int startRown = 1 + (selectPage - 1) * PAGE_SIZE;
		int endRown = startRown + PAGE_LINK - 1;
		
		// 상품 후기 가져오기
		ArrayList<WriteMemberReviewVo> productMemberReviewAjax = null;
		productMemberReviewAjax = new WriteMemberReviewService().productMemberReview(cateGory, startRown, endRown);
		JSONArray jArray = new JSONArray(); // json 배열
		JSONObject job = new JSONObject();
		String jsons = "";
		// Gson gson = new GsonBuilder().setPrettyPrinting().create();
		if (productMemberReviewAjax != null) {
			System.out.println("후기 가져오기 성공");
			for (int i = 0; i < productMemberReviewAjax.size(); i++) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("reviewTitle", productMemberReviewAjax.get(i).getReviewTitle());
				jsonObject.put("reviewContent", productMemberReviewAjax.get(i).getReviewContent());
				jsonObject.put("reviewWriter", productMemberReviewAjax.get(i).getReviewWriter());
				jsonObject.put("reviewDate", productMemberReviewAjax.get(i).getReviewDate());
				jsonObject.put("reviewImageUrl", productMemberReviewAjax.get(i).getReviewImageUrl());
				jArray.add(jsonObject);
			}
			job.put("reviewInfo", jArray);
		} else {
			System.out.println("후기 가져오기 실패");
		}
		System.out.println("productMemberReviewAjax : " + productMemberReviewAjax);
		System.out.println("job : " + job);
		System.out.println("jArray : " + jArray);
		System.out.println("job.toJSONString() : " + job.toJSONString());
		jsons = job.toJSONString();
		out.print(jsons);
		out.flush();
		out.close();
		}

}
