package com.petmaru.member.write.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.member.write.model.service.WriteMemberBoardService;
import com.petmaru.member.write.model.vo.WriteMemberBoardVo;

/**
 * Servlet implementation class WriteMemberBoardContentServlet
 */
@WebServlet("/boardcontent")
public class WriteMemberBoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberBoardContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String board_no = request.getParameter("no");
		System.out.println("memberSession(member id) : " + (String)request.getSession().getAttribute("memberLoginInfo"));
		System.out.println("no : " + board_no);
		// bno 를 가지고 DB에서 하나 읽어와야 함.  
		int bno = Integer.parseInt(board_no);
		// bno는 pk 로 결과는 Board 모양 1개일 것임.
		WriteMemberBoardVo vo = new WriteMemberBoardService().getBoard(bno);
		request.setAttribute("boardvo", vo);
		request.getRequestDispatcher("/WEB-INF/writemember/boardcontent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
