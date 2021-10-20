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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.petmaru.member.model.vo.MemberVo;
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	// jsonObject : {
	// "pName":"MONCHOUCHOU 10yrs Young Dog Frill Top Violet",
	// "opion_size":"SM, L, XL, M, L",
	// "price":"430000",
	// "count":10,
	// "opion_color":"RED, GREEN, GREEN, GREEN, NAVY",
	// "url":"http:\/\/marlonshop.com\/web\/product\/medium\/202109\/8b850806cacbd1dc2bada8006c8a9394.jpg"
	// }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buyJSON = request.getParameter("buy_json");
		System.out.println("servlet buyJSON : " + buyJSON);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = null;
		
		try {
			jsonObject = (JSONObject)parser.parse(buyJSON);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String size = (String)jsonObject.get("option_size");
		String[] sizeArr = size.split(", ");
		
		String color = (String)jsonObject.get("option_color");
		String[] colorArr = color.split(", ");
		
		String count = (String)jsonObject.get("count");
		String[] countArr = count.split(", ");
		
		System.out.println("jsonObject : " + jsonObject);
		System.out.println("jsonObject.get(pName) : " + jsonObject.get("pName"));
		System.out.println("jsonObject.get(option_size) : " + jsonObject.get("option_size"));
		System.out.println("jsonObject.get(price) : " + jsonObject.get("price"));
		System.out.println("jsonObject.get(count) : " + jsonObject.get("count"));
		System.out.println("jsonObject.get(option_color) : " + jsonObject.get("option_color"));
		System.out.println("jsonObject.get(url) : " + jsonObject.get("url"));
		System.out.println("size : " + size);
		for (int i = 0; i < sizeArr.length; i++) {
			System.out.println("sizeArr[" + i + "] : " + sizeArr[i]);
		}
		for (int i = 0; i < countArr.length; i++) {
			System.out.println("countArr[" + i + "] : " + countArr[i]);
		}
		
		request.setAttribute("pName", jsonObject.get("pName"));
		request.setAttribute("sizeArrWidth", sizeArr.length);
		request.setAttribute("sizeArr", sizeArr);
		request.setAttribute("price", jsonObject.get("price"));
		request.setAttribute("countArr", countArr);
		request.setAttribute("colorArr", colorArr);
		request.setAttribute("url", jsonObject.get("url"));
		request.getRequestDispatcher("/WEB-INF/productmember/productbuy.jsp").forward(request, response);
	}
}
