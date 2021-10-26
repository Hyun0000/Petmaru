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

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_writer = (String)request.getSession().getAttribute("memberLoginInfo");
		String noStr = (String)request.getParameter("no");
		int no = Integer.parseInt(noStr);
		System.out.println("no : "  + no);
//	  if (board_writer == null) {
//		  board_writer = "admin"; // 임시 user
//	  }

		WriteMemberBoardVo vo = new WriteMemberBoardVo();
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		vo.setBoard_writer(board_writer);
		vo.setBoard_no(no);

		int result = new WriteMemberBoardService().boardrewirte(vo);
		System.out.println("WriteMemberBoardService().boardrewirte result: " + result);

		if (result > 0) {
			response.sendRedirect("boardlist");
		} else {
			request.setAttribute("errMsg", "수정에 실패했습니다. 작성한 글을 다시 확인해 주세요.");
			request.getRequestDispatcher("/WEB-INF/confirm.jsp").forward(request, response);
		}
	}
}
