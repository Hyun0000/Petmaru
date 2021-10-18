package com.petmaru.member.write.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class WriteMemberInsertViewServlet
 */
@WebServlet("/writememberinsertview")
public class WriteMemberInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMemberInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
    	
    	String test = request.getParameter("test");
    	System.out.println("servlet : " + test);
    	JSONParser parser = new JSONParser();
    	JSONObject obj = null;
    	try {
			obj = (JSONObject)parser.parse(test);
		} catch (Exception e) {
			System.out.println("변환실패");
			e.printStackTrace();
		}
    		System.out.println("obj : " + obj);
    		System.out.println(obj.get("pno"));
		request.setAttribute("obj", obj);
    	request.getRequestDispatcher("/WEB-INF/writemember/writememberinsert.jsp").forward(request, response);
    }
}
