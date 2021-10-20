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
@WebServlet("/boardwrite")
public class WriteMemberBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberBoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_writer = null;
		if (board_writer == null) {
			board_writer = "user01";
			// TODO: 임시 user 설정. board_writer 받아오기
		}
		WriteMemberBoardVo vo = new WriteMemberBoardVo();
		int result = new WriteMemberBoardService().boardwirte(vo);
		response.sendRedirect("boardlist");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
