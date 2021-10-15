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
 * Servlet implementation class ProductMemberMainPageSubCarouselServlet
 */
@WebServlet("/mainpage")
public class ProductMemberMainPageSubCarouselServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**p
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberMainPageSubCarouselServlet() {
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
		
		ArrayList<ProductMemberVo> mainsubcarousel = null;
		mainsubcarousel = new ProductMemberService().mainsubcarousel();
	
		// 72개 가져왔나 확인
		// int i = 1;
		// for (ProductMemberVo productMemberVo : mainsubcarousel) { System.out.println(i + " : " + productMemberVo.getProductImgUrl()); i++; }
		
		request.setAttribute("mainsubcarousel", mainsubcarousel);
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
