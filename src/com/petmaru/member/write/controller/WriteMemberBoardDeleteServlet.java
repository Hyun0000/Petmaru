package com.petmaru.member.write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.petmaru.member.write.model.service.WriteMemberBoardService;

/**
 * Servlet implementation class WriteMemberDeleteServlet
 */
@WebServlet("/boarddelete")
public class WriteMemberBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// WRITER & TITLE을 조건으로 받는다.
    	response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String boardNo = request.getParameter("no");
		String strID = (String)request.getSession().getAttribute("memberLoginInfo");
		
		int result = 0;
		
		System.out.println("boardNo : " + boardNo);
		
		
		if (boardNo == null || boardNo.equals("")) { 
			System.out.println("파라미터  전송에 문제가 있다."); 
			request.setAttribute("errMsg", "bno 파라미터  전송에 문제가 있습니다. 작성한 글을 다시 확인해 주세요.");
			request.getRequestDispatcher("/WEB-INF/confirm.jsp").forward(request, response);
		}
		else if (strID == null || strID.equals("")) { 
			System.out.println("id 전송에 문제가 있다. 1"); 
			request.setAttribute("errMsg", "id 파라미터  전송에 문제가 있습니다. 작성한 글을 다시 확인해 주세요. 1");
			request.getRequestDispatcher("/WEB-INF/confirm.jsp").forward(request, response);
		}
		else {
			result = new WriteMemberBoardService().deleteBoard((int)Integer.parseInt(boardNo));
			System.out.println("result : " + result);
			
			if (result > 0) {
				request.setAttribute("errMsg", "삭제되었습니다.");
				request.getRequestDispatcher("/WEB-INF/confirm.jsp").forward(request, response);
			}
			else {
				request.setAttribute("errMsg", "글 삭제에 실패했습니다.");
				request.getRequestDispatcher("/WEB-INF/confirm.jsp").forward(request, response);
			}
		}
		
    }
}
