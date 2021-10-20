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
import com.petmaru.member.model.vo.MemberVo;
import com.petmaru.product.member.model.service.ProductMemberService;

/**
 * Servlet implementation class ProductMemberBuyAjaxServlet
 */
@WebServlet("/productbuyajax")
public class ProductMemberBuyAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberBuyAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("productbuyajax 진입");
//		response.setContentType("text/html; charset = UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
//		response.setContentType("application/json;charset=UTF-8");
		
		String idStr = request.getParameter("id");
		String id = "";
		if (idStr == null || idStr.equals("")) { System.out.println("id가 제대로 전달되지 않았습니다."); }
		else { id = idStr; }
		System.out.println("id : " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVo member = null;
		member = new ProductMemberService().searchMembrtInfo(id);
		Gson gson = new GsonBuilder().create();
		String gsonStr = ""; 
		
		if (member != null) {
			System.out.println("데이터 가져옴");
			map.put("name", member.getMember_name());
			map.put("address", member.getMember_address());
			map.put("phone", member.getMember_phone());
			map.put("point", member.getMember_point());
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
