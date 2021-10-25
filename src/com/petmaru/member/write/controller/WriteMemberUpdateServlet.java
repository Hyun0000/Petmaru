package com.petmaru.member.write.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.petmaru.member.write.model.service.WriteMemberReviewService;

/**
 * Servlet implementation class WriteMemberUpdateServlet
 */
@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
	)
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
		
		// 제목, 내용, 파일(사진) 수정
		// sql에서 where문의 조건은 title & userId로 한다.
		// 1. 기존 제목(조건)
		String titleStr = request.getParameter("update_title_origin");
		String title = "";
		if (titleStr == null || titleStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { title = titleStr; }
		
		// 2. 아이디 (조건)
		String idStr = request.getParameter("update_id");
		String id = "";
		if (idStr == null || idStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { id = idStr; }
		
		// 3. 변경할 제목
		String upTitleStr = request.getParameter("update_title");
		String upTitle = "";
		if (upTitleStr == null || upTitleStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { upTitle = upTitleStr; }

		// 4. 변경할 내용
		String contentStr = request.getParameter("update_content");
		String content = "";
		if (contentStr == null || contentStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { content = contentStr; }
		
		// 5. 변경할 파일(사진)
		// 수정시 단일 파일만 업로드 가능
		// 파일 data 받기
		Part filePart = request.getPart("update_photo");
		// 이걸로 조건걸려 했는데 값이 너무 복잡해 pass
		System.out.println("filePart : " + filePart);
		
		// 파일 data 읽어들이기 위한 Stream(통로, 파이프) 건설
		InputStream fis = filePart.getInputStream();
		
		// String uuid = UUID.randomUUID().toString();
		// System.out.println("uuid : " + uuid);
		 
		// 첨부파일명 얻기
		String fileName = UUID.randomUUID().toString() + "-" + filePart.getSubmittedFileName();
		System.out.println("fileName(파일명) : " + fileName);
		
		// 파일을 저장할 절대경로 얻기
		String realPath = "";
		
		// 원하는 (절대)경로에 해당 파일이 없을 경우 파일을 만들어 준다.
		File makeFile = null;
		
		// 파일 저장 경로 완전체 만들기		
		String fileSavePath = "";
		
		if (fileName.equals("")) { 
			System.out.println("파일 수정없이 제목 & 내용만 수정");
		} else {
			// 파일을 저장할 절대경로 얻기
			realPath = request.getServletContext().getRealPath("/upload");
			System.out.println("realPath(절대경로) : " + realPath);
			
			// 원하는 (절대)경로에 해당 파일이 없을 경우 파일을 만들어 준다.
			makeFile = new File(realPath);
			if (!makeFile.exists()) { System.out.println("파일이 경로에 존재하지 않으므로 경로 및 파일 생성"); makeFile.mkdirs(); }
			
			// 파일 저장 경로 완전체 만들기
			fileSavePath = realPath + File.separator + fileName;
			System.out.println("fileSavePath(진짜 저장 경로) : " + fileSavePath);
			
			// (진짜 저장 경로)를 가지고 파일 저장하기(뿌리기)
			// 파일 data 뿌리기 위한 Stream(통로, 파이프) 건설
			FileOutputStream fos = new FileOutputStream(fileSavePath);
			
			// 파일을 읽을 때 사용할 buffer 설정
			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
				// buf만큼 읽고(read) buf만큼 뿌린다(write)는 의미
			}
			fos.close();
			fis.close();
		}
		
		// 기존 후기 사진 url 받기
		String originImgUrl = request.getParameter("update_imgUrl");
		System.out.println("originImgUrl(기존 사진 url) : " + originImgUrl);
		
		int result = 0;
		result = new WriteMemberReviewService().writeMemberUpdate(title, id, upTitle, content, fileName);
		
		// 사진을 포함한 후기 수정이 완료됐을때 기존 후기 사진을 지우기
		if (result == 1 && !fileName.equals("")) {
			String[] splitFileName = originImgUrl.split("/");
			for (int i = 0; i < splitFileName.length; i++) {
				System.out.println("splitFileName[" + i + "] = " + splitFileName[i]);
			}
			
			String deletePath = realPath + File.separator + splitFileName[splitFileName.length - 1];
			
			File deleteFile = new File(deletePath);
			
			if (deleteFile.exists()) {
				deleteFile.delete();
				System.out.println("사진을 포함한 후기 수정 완료&기존 후기 사진 삭제 완료");
			} else {
				System.out.println("존재하는 파일이 없거나 다른 이유로 파일 삭제 실패");
			}
		} else if(result == 1) {
			System.out.println("제목과 내용 후기 수정 성공");
		}
		
		// sendRedirect용 카테고리랑 상품번호겂 얻기(ajax를 안쓰니까 해당 값을 받아와야한다.)
		// 1. 카테고리
		String categoryStr = request.getParameter("update_category");
		String category = "";
		if (categoryStr == null || contentStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { category = categoryStr; }
		
		// 2. 상품번호
		String pnoStr = request.getParameter("update_pno");
		String pno = "";
		if (pnoStr == null || pnoStr.equals("")) { System.out.println("받은 내용이 없습니다."); }
		else { pno = pnoStr; }
		
		response.sendRedirect("/Petmaru/productdetail?pno=" + pno + "&c=" + category);
		
		
		
	}
}
