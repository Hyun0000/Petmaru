package com.petmaru.member.write.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.write.model.service.WriteMemberBoardService;
import com.petmaru.member.write.model.vo.*;

/**
 * Servlet implementation class WriteMemberBoardWriteServlet
 */
@WebServlet("/boardrewrite")
public class WriteMemberBoardRewriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WriteMemberBoardRewriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/writemember/boardwrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		  String board_title = request.getParameter("board_title"); 
		  String board_content = request.getParameter("board_content"); 
		  String board_writer = request.getParameter("board_writer");
//		  if (board_writer == null) {
//			  board_writer = "admin"; // 임시 user
//		  }
		 
		WriteMemberBoardVo vo = new WriteMemberBoardVo();
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		vo.setBoard_writer(board_writer);
		
		int result = new WriteMemberBoardService().boardwirte(vo);
		System.out.println("WriteMemberBoardService().boardwirte result: "+ result);
		
		if(result > 0) {
			response.sendRedirect("boardlist");
		} else {
			request.setAttribute("errMsg", "등록에 실패했습니다. 작성한 글을 다시 확인해 주세요.");
			request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
		}
	}

}
