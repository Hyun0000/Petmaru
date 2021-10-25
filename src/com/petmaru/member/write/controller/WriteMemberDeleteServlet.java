package com.petmaru.member.write.controller;

import java.io.File;
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// WRITER & TITLE을 조건으로 받는다.
		// WRITER & TITLE 받기
		String titleStr = request.getParameter("title");
		String title = "";
		String writerStr = request.getParameter("writer");
		String writer = "";
		System.out.println("titleStr : " + titleStr);
		System.out.println("writerStr : " + writerStr);
		
		if (titleStr == null || titleStr.equals("")) { System.out.println("title 전송에 문제가 있다."); }
		else { title = titleStr; }
		System.out.println("title : " +title);
		
		if (writerStr == null || writerStr.equals("")) { System.out.println("id 전송에 문제가 있다."); }
		else { writer = writerStr; }
		System.out.println("writer : " +writer);
//================================================================================================================		
		// DB 송신 및 파일(사진) 삭제
		int result = 0;
		result = new WriteMemberReviewService().writememberdelete(title, writer);
		System.out.println("result : " + result);
		
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		
		if (result != 1) { System.out.println("삭제가 정상적으로 되지 않았다."); }
		
		if (result == 1) {

			System.out.println("리뷰 삭제 완료, 사진 파일 삭제 시작");
		//================================================================================================================			
			// upload 폴더에 있는 사진 파일 삭제
			// 조건 : WRITER & TITLE을 가지고 dao를 갖다온 후 삭제된 것이 있다면 이미지 파일도 삭제되게한다.(괜히 삭제 안 됐는데 파일만 삭제하면 안 되니까)
			// 1. 삭제할 사진 파일의 <img> 태그 경로(src) 얻기
			String fileName = request.getParameter("imgSrc");
			System.out.println("fileName : " + fileName);
			
			// (fileName : /PetmaruNeo/upload/mango.jpg) --> 이런 식으로 오니까 split()을 이용해 문자열 쪼개기
			String[] splitFileName = fileName.split("/");
			for (int i = 0; i < splitFileName.length; i++) {
				System.out.println("splitFileName[" + i + "] = " + splitFileName[i]);
			}
			
			// 쪼갠 마지막 문자열이 항상 파일명이다.
			String realFileName = splitFileName[splitFileName.length - 1];
			System.out.println("realFileName : " + realFileName);
			
			// 2. 파일이 있는 경로 얻기
			String realPath = request.getServletContext().getRealPath("/upload");
			System.out.println("realPath : " + realPath);
			
			// 3. 파일 삭제 경로 완전체
			String deletePath = realPath + File.separator + realFileName;
			System.out.println("deletePath : " + deletePath);
			
			File deleteFile = new File(deletePath);
			if (deleteFile.exists()) {
				deleteFile.delete();
				System.out.println("파일 삭제 완료");
			} else {
				System.out.println("존재하는 파일이 없거나 다른 이유로 파일 삭제 실패");
			}
		//================================================================================================================
			// ajax로 다시 보낼 data 담기
			jsonObject.put("result", result);
		} else {
			jsonObject.put("result", "false");
		}
		
		out.print(jsonObject.toJSONString());
		out.flush();
		out.close();
    }
}
