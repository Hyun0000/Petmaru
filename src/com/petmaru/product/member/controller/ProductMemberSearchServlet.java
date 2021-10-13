package com.petmaru.product.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmaru.product.member.model.service.ProductMemberService;
import com.petmaru.product.member.model.vo.ProductMemberVo;

/**
 * Servlet implementation class SearchProductServelt
 */
@WebServlet("/productsearch")
public class ProductMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberSearchServlet() {
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
		
		String keywordStr = request.getParameter("keyword");
		String keyword = "";
		System.out.println("keywordStr : " + keywordStr);
		
		if (keywordStr == null || keywordStr.equals("")) { System.out.println("키워드 전달 오류"); }
		else { keyword = keywordStr; }
		System.out.println("keyword : " + keyword);
		
		List<ProductMemberVo> productMemberSearch = null;
		productMemberSearch = new ProductMemberService().productMemberSearch(keyword);
		
		if (productMemberSearch == null) { System.out.println("검색 결과가 없습니다."); }
		else { System.out.println("검색 결과가 있다."); }
		
		System.out.println(productMemberSearch);
		
		request.setAttribute("productMemberSearch", productMemberSearch);
		request.getRequestDispatcher("/WEB-INF/productmember/productsearch.jsp").forward(request, response);
	}
}
