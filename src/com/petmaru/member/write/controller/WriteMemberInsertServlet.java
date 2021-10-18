package com.petmaru.member.write.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.petmaru.member.write.model.service.WriteMemberReviewService;

/**
 * Servlet implementation class WriteMemberInsertServlet
 */
@WebServlet("/writememberinsert")
public class WriteMemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 제목과 내용을 받는다. 아마도.....
//	    (SEQUENCE로 해결)  REVIEW_NO NUMBER CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
//	    (parameter로 받기) REVIEW_PRODUCT_CATEGORY CHAR(1) CONSTRAINT REVIEW_PRODUCT_CATEGORY_CK CHECK(REVIEW_PRODUCT_CATEGORY IN ('C', 'A', 'T', 'H', 'B', 'F')),
//	    (parameter로 받기) REVIEW_PRODUCT_NO NUMBER CONSTRAINT REVIEW_PRODUCT_NO_FK REFERENCES PRODUCT(PRODUCT_NO),
//	   	(parameter로 받기) REVIEW_TITLE VARCHAR2(300) CONSTRAINT REVIEW_TITLE_NN NOT NULL,
//	    (parameter로 받기) REVIEW_CONTENT VARCHAR2(2000) CONSTRAINT REVIEW_CONTENT_NN NOT NULL,
//		(SYSDATE로 받기) REVIEW_DATE TIMESTAMP DEFAULT SYSDATE,
//		(parameter & SESSION으로 받기) REVIEW_WRITER VARCHAR2(500) CONSTRAINT REVIEW_WRITER_FK REFERENCES MEMBER(MEMBER_ID),
//	    (무조건 Y로 고정) REVIEW_BUY CHAR(1) CONSTRAINT REVIEW_BUY_CK CHECK(REVIEW_BUY IN('Y','N')),
//	    (이거 어카지) REVIEW_IMAGE_URL VARCHAR2(500) CONSTRAINT REVIEW_IMAGE_URL_UK UNIQUE
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		// JSON 데이터 꺼내기
		String jData = request.getParameter("JSONData");
		System.out.println("jData : " + jData);
		
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(jData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("objInsert : " + obj);
		System.out.println("obj.pno : " + obj.get("pno"));
		
		// 1. 카테고리
		String categoryStr = (String)obj.get("category");
		String category = "";
		if (categoryStr == null || categoryStr.equals("")) { System.out.println("categoryStr 잘못 전달 : " + categoryStr); }
		else { category = categoryStr; }
		
		// 2. 상품번호
		String pnoStr = (String)obj.get("pno");
		int pno = 0;
		if (pnoStr == null || pnoStr.equals("")) { System.out.println("pnoStr 잘못 전달 : " + pnoStr); }
		else { pno = Integer.parseInt(pnoStr); }
		
		// 3. 제목
		String titleStr = (String)obj.get("title");
		String title = "";
		if (titleStr == null || titleStr.equals("")) { System.out.println("titleStr 잘못 전달 : " + titleStr); }
		else { title = titleStr; }
		
		// 4. 내용
		String contentStr = (String)obj.get("content");
		String content = "";
		if (contentStr == null || contentStr.equals("")) { System.out.println("contentStr 잘못 전달 : " + contentStr); }
		else { content = contentStr; }
		
		// 5. 작성자
		String writerStr = (String)request.getSession().getAttribute("memberLoginInfo");
		String writer = "";
		if (writerStr == null || writerStr.equals("")) { System.out.println("writerStr 잘못 전달 : " + writerStr); }
		else { writer = writerStr; }
		
		// 6. url
		// String urlStr = request.getParameter("url");
		String url = "https://i.pinimg.com/564x/7c/83/44/7c8344a79716844eb39fc5808b138b5d.jpg";
		// if (urlStr == null || urlStr.equals("")) { System.out.println("urlStr 잘못 전달 : " + urlStr); }
		// else { url = urlStr; }
		
		System.out.println("category : " + category);
		System.out.println("pno : " + pno);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("writer : " + writer);
		System.out.println("url : " + url);
		
		int result = 0;
		// 작성자 아이디는 session을 이용할 것이기에 따로 인자로 넣지 않는다.(dao에서 바로 넣어버린다)
		result = new WriteMemberReviewService().writememberinsert(category, pno, title, content, writer, url);
		System.out.println("result : " + result);
		
		if (result == 1) { System.out.println("후기글 작성 성공"); }
		else {System.out.println("후기글 작성 실패");}
		
		// 후기 작성후 해당 상품의 상세페이지로 다시 이동
		response.sendRedirect("/PetmaruNeo/productdetail?pno=" + pno + "&c=" + category);
	}
}
