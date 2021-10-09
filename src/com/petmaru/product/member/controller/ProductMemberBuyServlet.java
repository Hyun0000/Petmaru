package com.petmaru.product.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.petmaru.member.model.vo.Member;
import com.petmaru.product.member.model.service.ProductMemberService;
import com.petmaru.product.member.model.vo.ProductMemberVo;

/**
 * Servlet implementation class BuyProductServlet
 */
@WebServlet("/productbuy")
public class ProductMemberBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberBuyServlet() {
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
		
		// 결제 기능을 직접 구현하기는 어려우니 구매 버튼을 누를 때마다 상품 재고 개수에서 -1 씩 되는 방식으로 구현하고자 한다.
		// 이를 위해 특정 상품의 총 재고가 몇개인지를 알아와야한다.
		String pnoStr = request.getParameter("pno");
		int pno = 0;
		if (pnoStr == null) { pno = 1; } else { pno = Integer.parseInt(pnoStr); }
		
		ProductMemberVo product = null;
		product = new ProductMemberService().productbuy(pno);
		
		request.setAttribute("product", product);
		request.getRequestDispatcher("/WEB-INF/productmember/productbuy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=UTF-8");
		
		String idStr = request.getParameter("id");
		String id = "";
		if (idStr == null || idStr.equals("")) { id = "user01"; }
		else { id = idStr; }
		System.out.println("id : " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		Member member = null;
		member = new ProductMemberService().searchMembrtInfo(id);
		Gson gson = new GsonBuilder().create();
		String gsonStr = ""; 
		
		if (member != null) {
			System.out.println("데이터 가져옴");
			map.put("name", member.getMemberName());
			map.put("address", member.getMemberAdress());
			map.put("phone", member.getMemberPhone());
			map.put("memberInfo", member);
			
			gsonStr = gson.toJson(map);
		} else {
			System.out.println("데이터 가져오는거 실패");
		}
		System.out.println("gsonStr : " + gsonStr);
		out.print(gsonStr);
		out.flush();
		out.close();
	}

}
