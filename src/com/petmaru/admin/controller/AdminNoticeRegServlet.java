package com.petmaru.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.petmaru.notice.service.NoticeService;
import com.petmaru.notice.vo.NoticeVo;

/**
 * Servlet implementation class AdminNoticeRegServlet
 */
@MultipartConfig(

		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
		
		)


@WebServlet("/AdminNoticeRegServlet")
public class AdminNoticeRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/admin/NoticeReg.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String title = request.getParameter("title");
		System.out.print("title :");
		System.out.println(title);
		
		String content= request.getParameter("content");
		String isOpen= request.getParameter("open");
		
		Collection<Part> parts = request.getParts();
		StringBuilder builder = new StringBuilder();
		
		for(Part p : parts) {
			if(!p.getName().equals("file"))continue;
			if(p.getSize()==0) continue;
			
			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			builder.append(fileName);
			builder.append(",");
			
			InputStream fis = filePart.getInputStream();

			String realPath = request.getServletContext().getRealPath("/upload");
			System.out.println(realPath);
			
//			File path = new File(realPath);
//			if(!path.exists())
//				path.mkdirs();
//			
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);

			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);

			fos.close();
			fis.close();
		}	
//		builder.delete(builder.length()-1,builder.length());
		
		
		boolean pub = false;
		if(isOpen != null)
			pub = true;
		
		NoticeVo notice = new NoticeVo();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPub(pub);
		notice.setWriterId("Admin");
		notice.setFiles(builder.toString());
		
		
		NoticeService service = new NoticeService();
		int result = service.insertNotice(notice);
		

		response.sendRedirect("adminNoticelist");
	}

}
