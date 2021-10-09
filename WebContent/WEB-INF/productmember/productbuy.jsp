<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
	ProductMemberVo product = (ProductMemberVo)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/productbuy.css"/>
<link rel="stylesheet" type="text/css" href="<%=context_root %>/css/main.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script type="text/javascript" src="<%=context_root %>/js/productdetail.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
    <section>
        <article id="delivery_info">
            <h1>배송지 정보</h1>
            <hr id="delivery_info_hr">

            <!-- 유효성 검사 필요 -->
            <div id="input_box">
                <table>
                    <tr>
                        <td></td>
                        <td colspan="2" id="info_same_td"><input type="checkbox" id="info_same"><label for="info_same">구매자와 동일</label></td>
                    </tr>
                    <tr>
                        <td class="label_td"><label for="address">주소</label></td>
                        <td class="input_td"><input type="text" id="address" name="address" class="inputEle" placeholder="주소를 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td class="label_td"><label for="phone">번호</label></td>
                        <td class="input_td"><input type="text" id="phone" name="phone" class="inputEle" placeholder="번호를 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td class="label_td"><label for="name">이름</label></td>
                        <td class="input_td"><input type="text" id="name" name="name" class="inputEle" placeholder="이름를 입력해주세요"></td>
                    </tr>
                    <tr><!-- 요청사항은 select로? -->
                        <!-- 글자수 제한은 js로 두기 -->
                        <td class="label_td"><label for="need">요청사항</label></td>
                        <td class="input_td"><textarea name="need" id="need" cols="60" rows="5" ></textarea></td>
                    </tr>
                </table>
            </div>
            
            <div id="consumer_input">
                <table>
                    <tr>
                        <td><h1>구매자 정보</h1></td>
                    </tr>

                    <tr>
                        <td>
                            <label for="buyer_name">이름</label>
                            <input type="text" id="buyer_name" name="buyer_name" class="consumer_Ele">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="buyer_phone">번호</label>
                            <input type="text" id="buyer_phone" name="buyer_phone" class="consumer_Ele">
                        </td>
                    </tr>
                </table>
            </div>
            
        </article>
<!-- 상품 정보 구역 --><!-- 상품 정보 구역 --><!-- 상품 정보 구역 --><!-- 상품 정보 구역 -->
        <article id="product_info">
            <h1>상품 정보</h1>
            <hr id="product_info_hr">

            <div id="product_info_img">
                <img src="<%=product.getProductImgUrl()%>">
            </div>

            <div id="product_info_input">
                <table>
                    <tr>
                        <td class="product_info_input_span"><span>상품명</span></td>
                        <td>
                            <div id="product_name"><%=product.getProductName()%></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="product_info_input_span"><span>옵션</span></td>
                        <td>                            
                            <div id="product_opt"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="product_info_input_span"><label for="product_count">수량</label></td>
                        <td>
                            <input type="text" id="product_count">
                        </td>
                    </tr>
                    <tr>
                        <td class="product_info_input_span"><span>가격</span></td>
                        <td>
                            <div id="product_price"><%=product.getPrice()%></div>
                        </td>
                    </tr>
                </table>
            </div>
        </article>
<!-- 결제 및 포인트 정보 구역 --><!-- 결제 및 포인트 정보 구역 --><!-- 결제 및 포인트 정보 구역 --><!-- 결제 및 포인트 정보 구역 -->
        <article id="pay_info">
            <h1>결제 및 포인트 정보</h1>
            <hr id="pay_info_hr">

            <div id="pay">
                <table>
                    <tr>
                        <td class="pay_info_title">결제방식</td>
                        <td>
                            <div id="pay_choice">
                                <input type="radio" id="naver" name="pay_method">
                                <label for="naver" id="naver_label" style="background-color: #1EC800;">NaverPay<span class="material-icons" id="naver_V" style="display: none;">done</span></label>
                                
                                <input type="radio" id="kakao" name="pay_method">
                                <label for="kakao" id="kakao_label" style="background-color: #F7E600;">kakaoPay<span class="material-icons" id="kakao_V" style="display: none;">done</span></label>

                                <input type="radio" id="toss" name="pay_method">
                                <label for="toss" id="toss_label" style="background-color: royalblue;">Toss<span class="material-icons" id="Toss_V" style="display: none;">done</span></label>

                                <input type="radio" id="payco" name="pay_method">
                                <label for="payco" id="payco_label" style="background-color: red;">Payco<span class="material-icons" id="Payco_V" style="display: none;">done</span></label>

                                <input type="radio" id="card" name="pay_method">
                                <label for="card" id="card_label" style="background-color: wheat;">신용카드<span class="material-icons" id="card_V" style="display: none;">done</span></label>

                                <input type="radio" id="tongjang" name="pay_method">
                                <label for="tongjang" id="tongjang_label" style="background-color: tomato;">무통장<span class="material-icons" id="tongjang_V" style="display: none;">done</span></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="pay_info_title">포인트</td>
                        <td>
                            <input type="text" name="point" id="point" placeholder="현재 포인트">
                            <input type="checkbox" id="use_whole_point">
                            <label for="use_whole_point">전체 포인트 사용</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="pay_info_title">쿠폰</td>
                        <td>
                            <select name="coupon" id="coupon">
                                <option>쿠폰 선택</option>
                                <option value="discount_thousand">천원 할인</option>
                                <option value="discount_twenty">20% 할인</option>
                                <option value="discount_phone">SKT 10% 할인</option>
                                <option value="discount_stupid">짱구 애청자 할인</option>
                                <option value="discount_dog">누렁이 할인 쿠폰</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="pay_info_title">현금영수증</td>
                        <td>
                            <label for="cash_receipt_y">발행</label>
                            <input type="radio" name="cash_receipt" value="cash_receipt_y" id="cash_receipt_y">
                            <label for="cash_receipt_n">미발행</label>
                            <input type="radio" name="cash_receipt" value="cash_receipt_n" id="cash_receipt_n">
                            <input type="text" name="cash_receipt_phone" id="cash_receipt_phone" placeholder="번호 입력" display: none;">
                        </td>
                    </tr>
                </table>
            </div>

            <div id="payBtn">
                <button type="button">결제</button>
            </div>
        </article>
    </section>
    
       <script>
	       document.getElementById('cash_receipt_y').onclick = function() {
	           document.getElementById('cash_receipt_phone').style.display = 'inline-block';
	       }
	       document.getElementById('cash_receipt_n').onclick = function() {
	           document.getElementById('cash_receipt_phone').style.display = 'none';
	       }
	       
	       $('#info_same').on('click', function () {
	    		   console.log("ajax시작");
	    	   $.ajax({
	    		   type : "POST",
	    		   url : "productbuy",
	    		   data : {
	    			   id : "user01"
	    		   },
	    		   dataType : "json",
	    		   success : function (data) {
	    			   // 현재 data는 아래와 같은 상태이다.
	    			   // data = {
   								// "memberInfo":{"memberName":"이직걸",
  									// "memberPhone":"010-0000-0001",
									// "memberAdress":"서울시 용산구 001번지",
  						   			// "memberBirth":0,
  						   			// "memberGender":"\u0000",
  						   			// 	"memberPoint":0},
				   					// "address":"서울시 용산구 001번지",
					   				// "phone":"010-0000-0001",
					   				// "name":"이직걸"
				   				//}
	    			 	  console.log('success 진입')
					if (data != null) {
						console.log('데이터 가져옴');
						$('#address').val(data.memberInfo.memberAdress);
						$('#phone').val(data.memberInfo.memberPhone);
						$('#name').val(data.memberInfo.memberName);
						console.log('입력 성공');
					}
				},
					error : function () {
						alert('데이터 못 가져옴');
					}
    	   })
		})
       </script>
</body>
</html>