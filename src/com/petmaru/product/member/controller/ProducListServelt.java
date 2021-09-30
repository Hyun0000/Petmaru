package com.petmaru.product.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProducListServelt
 */
@WebServlet("/produclist")
public class ProducListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProducListServelt() {
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
		PrintWriter out = response.getWriter();
		
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if (bnoStr == null) { bno = 1; } else { bno = Integer.parseInt(bnoStr);}
		// bnoStr 값이 이상할시 기본값으로 '1' 설정 
		
		// 한 화면에 20개, 한 줄에 5개 상품
		final int PAGE_SIZE = 20; // 한 페이지에 보여질 상품 개수
		final int PAGE_LINK = 5; //  한 페이지에 보여질 페이지 링크 (5개씩 보여진다.)  exX) (1 2 3 4 5)
		
		// 이거는 request.getParameter("selectPage")로 나중에 바꿔야함
		int selectPage = 1; // 사용자가 선택한 페이지링크 번호
		// parseInt()도 해야한다.
		
		int startRown = 1 + (selectPage - 1)*PAGE_SIZE; // 처음 rownum
		int endRown = startRown + PAGE_SIZE - 1; // 마지막 rownum
		
		int totalProduct = 0; // 상품 전체 개수(각 카테고리별 개수이다. 상품 통합 개수가 아니라)
		totalProduct = new ProductMemberService().totalProduct(bno);
		
		 // 전체 페이지 링크 개수
		int totalPageLink = totalProduct / PAGE_SIZE;
		
		 // 가장 왼쪽 페이지 링크
		int startPageLink = totalPageLink / PAGE_SIZE;
		startPageLink = (totalPageLink % PAGE_SIZE == 0) ? startPageLink : startPageLink + 1;
		
		 // 가장 오른쪽 페이지 링크
		int endPageLink = startPageLink + PAGE_LINK - 1;
		
		if (selectPage > 1) { out.print(" << "); }
		if (endPageLink > totalPageLink) { endPageLink = totalPageLink; }
		for (int i = startPageLink; i <= endPageLink; i++) {
			out.print(i + ", ");
		}
		if (selectPage < totalPageLink) {
			out.print(" >> ");
		}
		
		ArrayList<Product> producClothestList = null;
		producClothestList = new ProductMemberService().productList(bno, startRown, endRown);
		
		for (Product product : producClothestList) {
			out.print(product.toStrings() + "<br>");
		}
		
		
		// 임시로 죽여놈
//		request.setAttribute("producClothestList", producClothestList);
//		request.getRequestDispatcher("/WEB-INF/memberproduct/productlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
