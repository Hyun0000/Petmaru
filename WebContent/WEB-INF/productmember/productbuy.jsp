<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/productbuy.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=context_root %>/js/template_header.js"></script>
<title>Petmaru</title>
</head>
<body>
<%@ include file="../template_header.jsp" %>
    <section id="pay_box">
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
                        <td class="input_td"><input type="text" id="phone" name="phone" class="inputEle" placeholder="(-) 포함해 번호를 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td class="label_td"><label for="name">이름</label></td>
                        <td class="input_td"><input type="text" id="name" name="name" class="inputEle" placeholder="이름를 입력해주세요"></td>
                    </tr>
                    <tr>
                        <!-- 글자수 제한은 js로 두기 -->
                        <td class="label_td"><label for="need">요청사항</label></td>
                        <td class="input_td">
                            <select name="need" id="need_select" style="width: 400px; height: 25px;" onchange="typeFunc(this);">
                                <option style="display: none;"></option>
                                <option value="need_one">문앞에 두고 가주세요</option>
                                <option value="need_two">오기전에 전화주세요</option>
                                <option value="need_three">문워크로 와주세요</option>
                                <option value="need_four">앞구르기로 와주세요</option>
                                <option value="need_five">오지마세요</option>
                                <option value="typing" id="change_textarea">직접입력</option>
                            </select>
                        <textarea name="need" id="need_textarea" cols="60" rows="5" style="width: 400px; display: none;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div id="consumer_input">
                <table id="consumer_input_table">
                    <tr>
                        <td><h1>구매자 정보</h1></td>
                    </tr>

                    <tr>
                        <td>
                            <label for="buyer_name">이름</label>
                            <input type="text" id="buyer_name" name="buyer_name" class="consumer_Ele" value="${fn:trim(memberSessionName)}">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="buyer_phone">번호</label>
                            <input type="text" id="buyer_phone" name="buyer_phone" class="consumer_Ele" value="${fn:trim(memberSessionPhone)}">
                        </td>
                    </tr>
                </table>
            </div>
            
        </article>
<!-- 상품 정보 구역 --><!-- 상품 정보 구역 --><!-- 상품 정보 구역 --><!-- 상품 정보 구역 -->
        <article id="product_info">
            <h1>상품 정보</h1>
            <hr id="product_info_hr">

			<div id="product_info_box">
	            <div id="product_info_img">
	                <img src="${url}">
	                <%-- <img src="<%=product.getProductImgUrl()%>"> --%>
	            </div>
	
	            <div id="product_info_input">
	                <table>
	                    <tr>
	                        <td class="product_info_first_td product_info_input_span"><span>상품명</span></td>
	                        <td class="product_info_second_td">
	                            <div id="product_name" class="info_frame_div">${pName}</div>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td class="product_info_first_td product_info_input_span"><span>옵션 & 수량</span></td>
	                        	<c:choose>
	                        	<c:when test="${category == 'C' }">
	                        	<c:forEach var="i" begin="0" end="${sizeArrWidth - 1}" step="1">
	                        <td class="product_info_second_td product_info_second_td_flex">
		                        		<div class="product_opt_flex_div">${sizeArr[i]}</div>
		                        		<div class="product_opt_flex_div">${colorArr[i]}</div>
		                        		<div class="product_opt_flex_div">${countArr[i]}</div>
	                        </td>
	                       		</c:forEach>
	                        	</c:when>
	                        	<c:when test="${category != 'C' }">
                       		<td class="product_info_second_td product_info_second_td_flex">
                       			<div class="product_opt_flex_div">${count_opt_not_c}</div>
                       		</td>
	                        	</c:when>
	                       		</c:choose>
	                    </tr>
	                    <tr>
	                        <td class="product_info_first_td product_info_input_span"><span>가격</span></td>
	                        <td class="product_info_second_td">
	                            <div id="product_price" class="info_frame_div">${price}원</div>
	                        </td>
	                    </tr>
	                </table>
	            </div>
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
                            <input type="text" name="point" id="point" placeholder="숫자만 입력해 주세요">
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
                            <input type="radio" name="cash_receipt" value="cash_receipt_n" id="cash_receipt_n" checked>
                            <input type="text" name="cash_receipt_phone" id="cash_receipt_phone" placeholder="(-) 포함해 번호를 입력해주세요">
                        </td>
                    </tr>
                </table>
            </div>

            <div id="payBtn">
                <button type="button" id="pay_btn">결제</button>
            </div>
        </article>
    </section>
    <%@ include file="../template_footer.jsp" %>
       <script>
	       document.getElementById('cash_receipt_y').onclick = function() {
	           document.getElementById('cash_receipt_phone').style.display = 'inline-block';
	       }
	       document.getElementById('cash_receipt_n').onclick = function() {
	           document.getElementById('cash_receipt_phone').style.display = 'none';
	           document.getElementById('cash_receipt_phone').value = "";
	       }
	       
	       $('#info_same').on('click', function () {
	    		// 배송지 정보 입력칸에 토글 방식 적용
	    	   if ($('#address').val() != "") {
	    		   $('#address').val("");
	    		   $('#phone').val("");
	    		   $('#name').val("");
			} else {
	    		   console.log("ajax시작");
	    	   $.ajax({
	    		   type : "POST",
	    		   url : "productbuyajax",
	    		   data : {
	    			   id : "${memberLoginInfo}"
	    		   },
	    		   dataType : "json",
	    		   success : function (data) {
	    			   // 현재 data는 아래와 같은 상태이다.
/* 	    				  data = {"memberInfo":{"memberName":"이직걸",
	    				   			  "memberPhone":"010-0000-0001",
	    				   			  "memberAdress":"서울시 용산구 001번지",
	    				   			  "memberBirth":0,
	    				   			  "memberGender":"\u0000",
	    				   			  "memberPoint":1000}}
	    			 	  console.log('success 진입') */
					if (data != null) {
						console.log('데이터 가져옴');
						$('#address').val($.trim(data.memberInfo.member_address));
						$('#phone').val($.trim(data.memberInfo.member_phone));
						$('#name').val($.trim(data.memberInfo.member_name));
						console.log('입력 성공');
					}
				},
					error : function () {
						alert('로그인을 먼저 진행해주세요');
						document.getElementById("info_same").checked = false;
					}
    		   })
			}
		})
		
		//============================================================================
		// '전체 포인트 사용' 체크박스를 누르면 현재 회원의 포인트 전액이 자동 입력
       $('#use_whole_point').on('click', function () {
    	   // 전체 포인트 사용 체크박스에 토글 방식 적용
    	   if ($('#point').val() != "") {
    		   $('#point').val("");
		} else {
	   		   console.log("ajax시작");
	   	   $.ajax({
	   		   type : "POST",
	   		   url : "productbuyajax",
	   		   data : {
	   			   id : "${memberLoginInfo}"
	   		   },
	   		   dataType : "json",
	   		   success : function (data) {
	   			 	  console.log('success 진입')
				if (data != null) {
					console.log('데이터 가져옴');
					$('#point').val(data.memberInfo.member_point);
					console.log('입력 성공');
				}
			},
				error : function () {
					alert('로그인을 먼저 진행해주세요');
					document.getElementById("use_whole_point").checked = false;
				}
	  	   })
		}  
	})
		//============================================================================
		// '현금영수증' 발행 radio를 누르면 현재 회원의 번호가 자동 입력
	       $('#cash_receipt_y').on('click', function () {
	   		   console.log("ajax시작");
	   	   $.ajax({
	   		   type : "POST",
	   		   url : "productbuyajax",
	   		   data : {
	   			   id : "${memberLoginInfo}"
	   		   },
	   		   dataType : "json",
	   		   success : function (data) {
	   			 	  console.log('success 진입')
				if (data != null) {
					console.log('데이터 가져옴');
					$('#cash_receipt_phone').val($.trim(data.memberInfo.member_phone));
					console.log('입력 성공');
				}
			},
				error : function () {
					alert('로그인을 먼저 진행해주세요');
					document.getElementById("cash_receipt_y").checked = false;
					document.getElementById("cash_receipt_n").checked = true;
					document.getElementById('cash_receipt_phone').style.display = 'none';
				}
	  	   })
		})
		//============================================================================
		// 유효성 검사
        // 요청사항을 textarea로 변경하는 event
        // css로 위치 수정 필요
        var textareaEle = document.getElementById('need_textarea');
        var selectEle = document.getElementById('need_select');


        function typeFunc(e) {
            if (e.value == "typing") {
                textareaEle.style.display = "block";
                // selectEle.style.display = "none";
            } else {
                textareaEle.style.display = "none";
                selectEle.style.display = "block";
            }
        }

        // 유효성 체크 이벤트 등록
        document.getElementById('pay_btn').onclick = payFunction;

        //==============================배송지 정보 부분==============================
        function payFunction() {
        	// 결제 완료 팝업창 변수
        	let payBool = true;
        	
            // nullCheck function
            function nullCheckC(e) {
                if (e.value == "") {
                	payBool = false;
                    alert('빈칸을 입력해주세요');
                    // e의 모습 예시 --> document.getElementById('address')
                }
            }

            // (1). 공백 검사
            // 1. 주소
            var addressEle = document.getElementById('address');
            // 2. 번호
            var phoneEle = document.getElementById('phone');
            // 3. 이름
            var nameEle = document.getElementById('name');
            
            nullCheckC(addressEle);
            nullCheckC(phoneEle);
            nullCheckC(nameEle);
            
            // 4. 요청사항(textarea)
            // textarea가 활성화 될때만 공백 체크
            if (textareaEle.style.display == "block") {
                var needEle = document.getElementById('need_textarea');
                nullCheckC(needEle);
            }

            // (2). 정규식 검사
            // 1. 번호
            let phoneRegExp = /^01[0-9]-[0-9]{4}-[0-9]{4}$/;
            if (!phoneRegExp.test(phoneEle.value)) {
            	payBool = false;
                alert('핸드폰 번호를 올바르게 입력해주세요');
            }

            // 2. 이름
            var nameRegExp = /^[가-힣a-zA-Z]{2,10}$/;
            if (!nameRegExp.test(nameEle.value)) {
            	payBool = false;
                alert('이름을 올바르게 입력해주세요');
            }
        //==============================결제 및 포인트 정보 부분==============================
            // (1). 포인트칸에 숫자만 입력되게(기호도 일절없이 오직 숫자만)
            var pointEle = document.getElementById('point');
            var pointRegExp = /^[0-9]*$/g;
            // g --> 글로벌 : 전체에서 정규식 만족을 확인한다.
            // * --> 글자수 무제한
            if (!pointRegExp.test(pointEle.value)) {
            	payBool = false;
                alert('포인트 금액을 정확히 입력해주세요');
            }

            // (2). 현금영수증 번호 입력 정규식 검사
            // 현금 영수증 번호 입력칸이 보이면 정규식 체크 진행

            let pointPhoneEleValue = pointPhoneEle.value; // 현금 영수증 번호 입력칸의 value
            if (pointPhoneEle.style.display == 'inline-block') {
                if (!phoneRegExp.test(pointPhoneEleValue)) {
                	payBool = false;
                    alert('핸드폰 번호를 올바르게 입력해주세요');
                }
            }
        //=======================모든 유효성 검사 통과, 결제 성공 알림창======================
        	if (payBool === true) {
	            alert('결제 성공');
			}
        }

        // 현금 영수증 번호 입력칸 토글 이벤트
        // 기본은 번호 입력칸 none
        let pointPhoneEle = document.getElementById('cash_receipt_phone'); // 현금 영수증 번호 입력칸

         /* pointPhoneEle.style.display = 'none';

        document.getElementById('cash_receipt_y').checked = function() {
            pointPhoneEle.style.display = 'inline-block';
        }
        document.getElementById('cash_receipt_n').checked = function() {
            pointPhoneEle.style.display = 'none';
        } */
        //=====================================================================
       	// 로그아웃 시 [구매자 정보] 입력값 삭제
       	let idEle = document.getElementById('buyer_name');
       	let phoneEle = document.getElementById('buyer_phone');
       	
       	if (${empty memberLoginInfo}) {
       		idEle.value = "";
       		phoneEle.value = "";
		}
       </script>
</body>
</html>