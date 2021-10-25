package com.petmaru.member.write.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.petmaru.member.write.model.service.WriteMemberReviewService;

/**
 * Servlet implementation class WriteMemberInsertServlet
 */
@WebServlet("/writememberinsert")
@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
	)
public class WriteMemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    (SEQUENCE로 해결)  REVIEW_NO NUMBER CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
//	    (parameter로 받기) REVIEW_PRODUCT_CATEGORY CHAR(1) CONSTRAINT REVIEW_PRODUCT_CATEGORY_CK CHECK(REVIEW_PRODUCT_CATEGORY IN ('C', 'A', 'T', 'H', 'B', 'F')),
//	    (parameter로 받기) REVIEW_PRODUCT_NO NUMBER CONSTRAINT REVIEW_PRODUCT_NO_FK REFERENCES PRODUCT(PRODUCT_NO),
//	   	(parameter로 받기) REVIEW_TITLE VARCHAR2(300) CONSTRAINT REVIEW_TITLE_NN NOT NULL,
//	    (parameter로 받기) REVIEW_CONTENT VARCHAR2(2000) CONSTRAINT REVIEW_CONTENT_NN NOT NULL,
//		(SYSDATE로 받기) REVIEW_DATE TIMESTAMP DEFAULT SYSDATE,
//		(parameter & SESSION으로 받기) REVIEW_WRITER VARCHAR2(500) CONSTRAINT REVIEW_WRITER_FK REFERENCES MEMBER(MEMBER_ID),
//	    (무조건 Y로 고정) REVIEW_BUY CHAR(1) CONSTRAINT REVIEW_BUY_CK CHECK(REVIEW_BUY IN('Y','N')),
//	    REVIEW_IMAGE_URL VARCHAR2(500) CONSTRAINT REVIEW_IMAGE_URL_UK UNIQUE
// ============================================================================================================================
		String titleStr = request.getParameter("title");
		String title = "";
		if (titleStr == null || titleStr.equals("")) { System.out.println("title 전달이 제대로 되지 않았습니다."); }
		else { title = titleStr; }
		
		System.out.println("title : " + title);
		
		String contentStr = request.getParameter("content");
		String content = "";
		if (contentStr == null || contentStr.equals("")) { System.out.println("content 전달이 제대로 되지 않았습니다."); }
		else { content = contentStr; }
		
		String categoryStr = request.getParameter("category");
		String category = "";
		if (categoryStr == null || categoryStr.equals("")) { System.out.println("category 전달이 제대로 되지 않았습니다."); }
		else { category = categoryStr; }
		
		String pnoStr = request.getParameter("pno");
		int pno = 0;
		if (pnoStr == null || pnoStr.equals("")) { System.out.println("pno 전달이 제대로 되지 않았습니다."); }
		else { pno = Integer.parseInt(pnoStr); }
		
		String writerStr = request.getParameter("writer");
		String writer = "";
		if (writerStr == null || writerStr.equals("")) { System.out.println("writer 전달이 제대로 되지 않았습니다."); }
		else { writer = writerStr; }
		
		// 2. 여러개의 파일을 받을 때
		// - 몇개의 파일이 전달될지 알수 없으므로 Collection으로 받을 준비를 힌다.
		Collection<Part> parts = request.getParts();
		// !!! getPart()가 아니라 getPart's'()이다.
		
		StringBuilder builder = new StringBuilder();
		
		// 받은 파일이 여러개이므로 그것들을 각각 읽고 뿌리기 위해 for문을 이용한다.
		for (Part p : parts) { // foreach문 시작
			if (!p.getName().equals("file")) {
				continue;
			}
			
			// 2-1.
			// 여러개의 파일을 받을 때  파일 data 얻기
			Part filePart = p;
			// cf) 한 개의 파일을 받을 때  --> Part filePart = request.getPart("file");

			// 2-2.
			InputStream fis = filePart.getInputStream();
			// 받은 파일을 읽어 들이는 stream(통로)을 건설한다.
			
			// 3.
			// 파일명 얻기(사진이면 사진의 이름, 엑셀 파일이면 엑셀 파일의 이름을 얻는 것이다.) --> filePart.getSubmittedFileName() 이게 찐이다.
			// UUID를 이용해 파일 이름의 중복을 피한다.
			String fileName = UUID.randomUUID().toString() + "-" + filePart.getSubmittedFileName();
			
			// 4.
			// DB에 보낼 파일명 작성(여러개의 파일명을 하나로 이어주는 것이다.)
			builder.append(fileName);
			builder.append(",");
			System.out.println("fileName : " + fileName);
			
			// 5.
			// 파일을 저장할 경로 얻기
			String realPath = request.getServletContext().getRealPath("/upload");
			
			System.out.println("realPath : " + realPath);
			
			// 5-1.
			// 원하는 경로에 파일이 없을 경우 realPath 경로에 맞춰 파일을 만들어준다.
			File path = new File(realPath);
			if (!path.exists()) { path.mkdirs(); }
	
			// 6.
			// 파일이 저장되는 경로 만들기
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			byte[] buf = new byte[1024]; // 1kb 씩 읽을 것이다.
			int size = 0;
			while((size = fis.read(buf)) != - 1) { // read(byte[] b) --> 미리 설정한 바이트 배열의 양만큼 데이터를 읽는다.
				fos.write(buf, 0, size); // buffer에 담은 것을 출력한다.
				
			}
			fos.close();
			fis.close();
		} // foreach문 종료
		
		
		builder.delete(builder.length() - 1, builder.length());
		System.out.println();
		int result = 0;
		result = new WriteMemberReviewService().writememberinsert(category, pno, title, content, writer, builder.toString());
		
		System.out.println("builder : " + builder);
		
		if (result == 1) { System.out.println("후기글 작성 성공"); }
		else {System.out.println("후기글 작성 실패");}
		
		// 후기 작성후 해당 상품의 상세페이지로 다시 이동
		response.sendRedirect("/Petmaru/productdetail?pno=" + pno + "&c=" + category);
	}
}
