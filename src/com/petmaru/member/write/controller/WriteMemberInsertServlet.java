package com.petmaru.member.write.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		// 1. 카테고리
		String categoryStr = request.getParameter("category");
		String category = "";
		if (categoryStr == null || categoryStr.equals("")) { System.out.println("category 잘못 전달"); }
		else { category = categoryStr; }
		
		// 2. 상품번호
		String pnoStr = request.getParameter("pno");
		String pno = "";
		if (pnoStr == null || pnoStr.equals("")) { System.out.println("pno 잘못 전달"); }
		else { pno = pnoStr; }
		
		// 3. 제목
		String titleStr = request.getParameter("title");
		String title = "";
		if (titleStr == null || titleStr.equals("")) { System.out.println("title 잘못 전달"); }
		else { title = titleStr; }
		
		// 4. 내용
		String contentStr = request.getParameter("content");
		String content = "";
		if (contentStr == null || contentStr.equals("")) { System.out.println("content 잘못 전달"); }
		else { content = contentStr; }
		
		// 5. 작성자
		String writerStr = request.getParameter("writer");
		String writer = "";
		if (writerStr == null || writerStr.equals("")) { System.out.println("writer 잘못 전달"); }
		else { writer = writerStr; }
		
		System.out.println("category : " + category);
		System.out.println("pno : " + pno);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("writer : " + writer);
		
		int result = 0;
		// result = new WriteMemberReviewService().writememberinsert(title, content);
		System.out.println("result : " + result);
		
		if (result == 1) { System.out.println("후기글 작성 성공"); }
		else {System.out.println("후기글 작성 실패");}
		
		
		response.sendRedirect("detail + pno와 카테고리를 아예 getParameter로 받아와야한다.");
	}
}
