package com.petmaru.product.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.petmaru.member.write.model.service.WriteMemberReviewService;
import com.petmaru.member.write.model.vo.WriteMemberReviewVo;
import com.petmaru.product.member.model.service.ProductMemberService;
import com.petmaru.product.member.model.vo.ProductMemberVo;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/productdetail") // ajax
public class ProductMemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMemberDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset = UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json;charset=UTF-8");
//==================================================================================================================================
		// 상품 정보 가져오기
		String cateGory = request.getParameter("c"); // 상품 정보 & 후기 모두에 쓰일 변수
		String pnoStr = request.getParameter("pno");
		int pno = 1;
		if (pnoStr != null) { pno = Integer.parseInt(pnoStr); }
		if (cateGory == null || cateGory.equals("")) { cateGory = "C"; } // URL로 넘어오는 값이 이상할 경우 default 값으로 "C"(의상) 설정
			
		ProductMemberVo product = null;
		product = new ProductMemberService().productDetail(pno, cateGory);
//==================================================================================================================================
		// 후기 작성 버튼 SHOW, HIDE --> pno를 argument(인자)로 받는다.
		// 결제 여부 문자값을 담을 변수
		String payYN = null;
		// 회원 아이디를 가져오는 것은 session을 이용한다.
		String id = (String)request.getSession().getAttribute("memberLoginInfo");
		System.out.println("id : " + id); 
		
		payYN = new ProductMemberService().reviewInsertBtnShow(pno, id);
		System.out.println("payYN servlet :" + payYN);
		if (payYN == null) {
			System.out.println("결제 여부 데이터를 가져오는데 문제가 발생했다.");
		}
		
//==================================================================================================================================
		// 후기 목록 페이징
		final int PAGE_SIZE = 5; // 한 화면에 보여질 후기 글 개수
		final int PAGE_LINK = 5; // 한 페이지에 보여질 페이지 링크 (5개씩 보여진다.)  exX) (1 2 3 4 5)
		
		// 사용자 선택 리뷰 페이지 링크 번호
		String selectPageStr = request.getParameter("reviewpage");
		int selectPage = 1;
		System.out.println("selectPageStr : " + selectPageStr);
		
		// selectPageStr가 null 일 때 selectPage을 기본값(1)로 설정 
		if (selectPageStr == null || selectPageStr.equals("")) { selectPage = 1; } else { selectPage = Integer.parseInt(selectPageStr); }
		
		// rownum 숫자
		int startRown = 1 + (selectPage - 1) * PAGE_SIZE;
		int endRown = startRown + PAGE_LINK - 1;
		
		ArrayList<WriteMemberReviewVo> productMemberReview = null;
		productMemberReview = new WriteMemberReviewService().productMemberReview(cateGory, startRown, endRown);
		System.out.println("servlet : " + productMemberReview);
		
		// 사용자 선택 페이지 링크 수에 따른 화면에 보여질 페이지 링크 수
		// 1. 후기 글의 총 개수(각 상품 카테고리 별)
		int allReview = new WriteMemberReviewService().allReview(cateGory);
		
		int totalPageLink = allReview / PAGE_SIZE; // 전체 페이지 링크 개수
		totalPageLink = (allReview % PAGE_SIZE == 0) ? totalPageLink : totalPageLink + 1; 
		
		int startPageLink = 0;
		if (selectPage % PAGE_LINK == 0) {
			startPageLink = selectPage - PAGE_LINK + 1;
		} else {
			startPageLink = selectPage - (selectPage % PAGE_LINK) + 1;
		}

		int endPageLink = startPageLink + PAGE_LINK - 1;
		
		// 전체 페이지 링크수 보다 마지막 페이지 링크수가 더 크면 해당 링크수를 전체 페이지 링크수로 수정
		if (endPageLink > totalPageLink) { endPageLink = totalPageLink; }
		
		request.setAttribute("payYN", payYN);
		request.setAttribute("PAGE_SIZE", PAGE_SIZE);
		request.setAttribute("totalPageLink", totalPageLink);
		request.setAttribute("startPageLink", startPageLink);
		request.setAttribute("endPageLink", endPageLink);
		request.setAttribute("selectPage", selectPage);
		request.setAttribute("product", product);
		request.setAttribute("productMemberReview", productMemberReview);
		request.getRequestDispatcher("/WEB-INF/productmember/productdetail.jsp").forward(request, response);
	}
}
