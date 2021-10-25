package com.petmaru.product.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.product.member.model.service.ProductMemberService;
import com.petmaru.product.member.model.vo.ProductMemberVo;

/**
 * Servlet implementation class ProducListServelt
 */
@WebServlet("/produclist")
public class ProductMemberListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberListServelt() {
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
		
		String cateGory = request.getParameter("category");
		
		// cateGory가 null일시 cateGory 값을 C로 설정
		if (cateGory == null || cateGory.equals("")) { cateGory = "C"; }
		
		// 한 화면에 20개, 한 줄에 5개 상품
		final int PAGE_SIZE = 20; // 한 페이지에 보여질 상품 개수
		final int PAGE_LINK = 5; //  한 페이지에 보여질 페이지 링크 (5개씩 보여진다.)  exX) (1 2 3 4 5)
		
		// 사용자가 선택한 페이지링크 번호
		String selectPageStr = request.getParameter("page");
		int selectPage = 0;
		if (selectPageStr == null) { selectPage = 1; } else { selectPage = Integer.parseInt(selectPageStr);}
		
		// 사용자가 1보다 작은 페이지링크 선택시 무조건 1 페이지로 링크되도록 설정
		if (selectPage < 1) { selectPage = 1; }
		
		int startRown = 1 + (selectPage - 1)*PAGE_SIZE; // 처음 rownum
		int endRown = startRown + PAGE_SIZE - 1; // 마지막 rownum
		
		int totalProduct = 0; // 상품 전체 개수(각 카테고리별 개수이다. 상품 통합 개수가 아니라)
		totalProduct = new ProductMemberService().totalProduct(cateGory);
		
		 // 전체 페이지 링크 개수
		int totalPageLink = totalProduct / PAGE_SIZE;
		// 100 / 20 = 5
		// 103 / 20 = 5.xxxxx
		totalPageLink = (totalProduct % PAGE_SIZE == 0) ? totalPageLink : totalPageLink + 1;
		
		// 가장 왼쪽 페이지 링크
		// int startPageLink = PAGE_SIZE / totalPageLink;
		int startPageLink = 0;
		if (selectPage % PAGE_LINK == 0) {
			startPageLink = (selectPage - PAGE_LINK) + 1;
		} else {
			startPageLink = (selectPage / PAGE_LINK)*PAGE_LINK + 1;
		}
		
		// startPageLink = (totalPageLink % PAGE_SIZE == 0) ? startPageLink : startPageLink + 1;
		
		// 가장 오른쪽 페이지 링크
		int endPageLink = startPageLink + PAGE_LINK - 1;
		
		// 전체 페이지 링크수 보다 마지막 페이지 링크수가 더 크면 마지막 페이지 링크수를 전체 페이지 링크수로 수정
		if (endPageLink > totalPageLink) { endPageLink = totalPageLink; }
		
//		if (selectPage > 1) { out.print(" << "); }
//		
//		if (endPageLink > totalPageLink) { endPageLink = totalPageLink; }
		
//		for (int i = startPageLink; i <= endPageLink; i++) {
//			out.print(i + ", ");
//		}
//		
//		if (selectPage < totalPageLink) { out.print(" >> "); }
//		
		ArrayList<ProductMemberVo> producClothestList = null;
		producClothestList = new ProductMemberService().productList(cateGory, startRown, endRown);
		
		// JSP로 보낼 Data
		request.setAttribute("totalPageLink", totalPageLink);
		request.setAttribute("startPageLink", startPageLink);
		request.setAttribute("endPageLink", endPageLink);
		request.setAttribute("selectPage", selectPage);
		request.setAttribute("producClothestList", producClothestList);
		request.getRequestDispatcher("/WEB-INF/productmember/productlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
