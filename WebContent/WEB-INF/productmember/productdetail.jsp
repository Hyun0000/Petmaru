<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>>/css/writememberupdate.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/productdetail.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css"/>
<%@page import="com.petmaru.member.write.model.vo.WriteMemberReviewVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.petmaru.product.member.model.vo.ProductMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context_root = request.getContextPath();
 	ArrayList<WriteMemberReviewVo> productMemberReview = (ArrayList<WriteMemberReviewVo>)request.getAttribute("productMemberReview");
	int totalPageLink = (int)request.getAttribute("totalPageLink");
	int startPageLink = (int)request.getAttribute("startPageLink");
	int endPageLink = (int)request.getAttribute("endPageLink");
	int selectPage = (int)request.getAttribute("selectPage"); 
	ProductMemberVo product = (ProductMemberVo)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=context_root %>/js/template_header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Petmaru</title>
</head>
<body>

<%@ include file="../template_header.jsp" %>
       <section>
        <div id="product_img">
            <img src="<%=product.getProductImgUrl() %>">
        </div>

        <div id="product_write_icon">
            <div id="write">
                <h1><%=product.getProductName() %></h1>
                <h4><%=product.getCom() %></h4>
            </div>

            <div id="price">
                <h2><%=product.getPrice() %>원</h2>
                <c:if test="${payYN == 'Y'}">
	                <!-- 특정 조건이 맞아야 후기 작성 버튼이 보이도록 수정 필요 -->
	                <!-- JSON을 이용해 data 전송 -->
	                <form id="insertForm">
	                <input type="hidden" id="test" name="test">
	                <button id="insertA">후기작성</button>
	              	</form>
              	</c:if>
            </div>

            <div id="icon">
                <a href="<%=context_root%>/productbuy?pno=<%=product.getProductNo() %>" id="purchase">BUY</a>
                <a href="#" id="cart">CART</a>
            </div>
        </div>
    </section>
    
	<section id="review_sec">
       <div id="review_top_line"><h1>Review</h1></div>
		<div id="review_content">
	         <ul id="review_list">
				<c:forEach var="productMemberReview" items="${productMemberReview}">
						<c:set var="k" value="${1+k}"></c:set>
		                <li class="review_li_same review_li_${k}">
		                    <div class="review_img_same review_img_${k}">
		                        <img src="${productMemberReview.reviewImageUrl}" class="img_same img_same_${k}">
		                    </div>
		
		                    <div id="review_box">
			                    <!-- 처음에 page load시 1page의 후기들이 보이도록 설정 -->
		                        <h5 class="review_title_same review_title_${k}">${productMemberReview.reviewTitle}</h5><br>
		                        <p class="review_write_content_same review_write_content_${k}">${productMemberReview.reviewContent}</p><br>
		                    
		                        <div class="review_write_info">
		                        	<div class="review_writer_date">
			                            <span class="review_writer_same review_writer_${k}">${productMemberReview.reviewWriter}</span>
			                            <span class="review_date_same review_date_${k}">${productMemberReview.reviewDate}</span>
		                            </div>
		                            <div class="btns btns_${k}" style="display: none;">
		                            	<!-- 로그인한 회원의 id와 후기 작성자의 id가 일치할때만 수정 삭제 버튼이 보인다.  style="display: none;"-->
			                            <%-- <c:if test="${memberLoginInfo == productMemberReview.reviewWriter}"> --%>
			                            <%-- <c:if test="${!empty memberLoginInfo}"> --%>
			                            	<button class="review_update_same review_update_${k}">수정</button>
			                            	<button class="review_delete_same review_delete_${k}">삭제</button>
				                            <%-- <a class="review_update_same review_update_${k}">수정</a> --%>
				                            <%-- <a onclick="deleteAlert();" class="review_delete_same review_delete_${k}">삭제</a> --%>
			                            <%-- </c:if> --%>
		                            </div>
		                        </div>
		                    </div>
		                </li>
	                </c:forEach>
	            </ul>
		</div>
		
		<div id="page">
			<c:choose>
				<c:when test="${selectPage > endPageLink }">리뷰가 존재하지 않습니다.</c:when>
				<c:when test="${selectPage < startPageLink }">리뷰가 존재하지 않습니다.</c:when>
				<c:when test="${selectPage != 0 }">
					<c:forEach begin="${startPageLink}" end="${endPageLink}" step="1" var="i">
						<%-- <a class="pageLink_same pageLink_${i}">${i}</a> --%>
						<button class="pageLink_same pageLink_${i}">${i}</button>
						<%-- <a href="/PetmaruNeo/productdetail?reviewpage=${i}" class="pageLink_same pageLink_${i}">${i}</a> --%>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	
	<%@ include file="../template_footer.jsp" %>
	
		<!-- 후기 수정 창(모달창 형식) -->
		<!-- 나중에  review_update_${k} 맞게 모달 팝업 이벤트 수정 필요 -->
       <div id="update_box">
               <table id="update_table">
                   <tr>
                       <td class="title_td">제목</td>
                       <td class="content_td"><input id="update_title" name="update_title" type="text"></td>
                   </tr>

                   <tr>
                       <td class="title_td">상세리뷰</td>
                       <td class="content_td" id="textarea_td"><textarea id="update_content" name="update_content" cols="80" rows="15"></textarea></td>
                   </tr>

                   <tr>
                       <td class="title_td">사진첨부</td>
                       <td class="content_td">
                           <label id="update_photo_label" for="update_photo">업로드</label>
                           <!-- <td class="content_td"><input type="file" name="photo_file" id="photo_file"></td> -->
                           <input type="file" id="update_photo" hidden>
                       </td>
                   </tr>

                   <tr>
                       <!-- 유효성 검사하기 -->
                       <td colspan="2" id="btn_td"><button type="button" id="update_btn">후기 수정</button></td>
                   </tr> 
               </table>
         </div>
	<script>
		//=====================================================================================================
		// 후기 글을 가져오는 ajax
 			for (var i = "${startPageLink}"; i <= "${endPageLink}"; i++) {
 				console.log("pagelink 시작");
				$('.pageLink_' + i).on('click', function() {
					console.log("ajax시작");
					$.ajax({
		                type : "POST",
		                url : "writememberreviewview",
		                data : {
		                	cateGory : "<%=product.getProductCategory()%>",
		                    reviewpage : $(this).text()
		                },
		                dataType : "json",
		                success : function (data) {
		                	console.log("success 시작");
		                	if (data != null) {
		                		console.log("if 시작");
	                				// 삭제 & 수정 버튼에 적용된 스타일 숨기기
		                			$('.btns').css('display', 'none');
		                			// <ul id="review_list"> 아래의 모든 내용만 삭제(태그는 그대로 유지)
									$('#review_list').find().empty();
		                			// 이미지 속성 제거
		                			$('.img_same').removeAttr("src");
		                		for (let i = 0; i < data.reviewInfo.length; i++) {
		                			console.log("for 시작 : " + data.reviewInfo.length);
		                			
		                			$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);
		                			$('.review_title_' + (i + 1)).text(data.reviewInfo[i].reviewTitle);
		                			$('.review_write_content_' + (i + 1)).text(data.reviewInfo[i].reviewContent);
		                			$('.review_date_' + (i + 1)).text(data.reviewInfo[i].reviewDate);
		                			$('.review_writer_' + (i + 1)).text(data.reviewInfo[i].reviewWriter);
		                			
		           					if ("${memberLoginInfo}" == $('.review_writer_' + (i + 1)).text()) {
		           	   					$('.btns_' + (i + 1)).css('display', 'block');
		           						$('.review_update_same').text('수정');
		           						$('.review_delete_same').text('삭제');
		           					}
		                		}
							}
						},
						error : function(request,status,error) {
		                	console.log("false")
		                    alert('후기가 없습니다.');
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
					})
				})
			}
		//=====================================================================================================
		// 후기 글을 삭제하는 ajax
			console.log("ajax 삭제 for 시작");
			$('.review_delete_same').on('click',function() {
				console.log(this);
				// 삭제 여부를 묻는 팝업
				let deleteBool = confirm('정말 삭제하시겠습니까?');
				if (deleteBool == true) {
				console.log("ajax 삭제 시작");
				$.ajax({
	                type : "POST",
	                url : "writememberdelete",
	                data : {
	                	title : $(this).parents('#review_box').find(".review_title_same").text(),
	                	writer : $(this).parents('#review_box').find(".review_writer_same").text()
	                },
	                dataType : "json",
	                success : function (data) {
	                	console.log("success 진입");
	                	console.log(data);
	                	console.log(data.result);
						if (data.result == 1) {
							console.log(this);
							alert('삭제가 왼료되었습니다.');
							window.location.reload();
							// 새로 고침 이벤트
						} else {
							alert('삭제가 실패');
						}
					},
					error : function(request,status,error) {
	                	console.log("false 진입");
	                    alert('삭제 실패');
	                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                }
					})
				}
			})
		// ======================================================================
		// update 팝업 이벤트 및 수정
			let updateTitle = document.getElementById('update_title');
			let updateContent = document.getElementById('update_content');
			let updateBox = document.getElementById('update_box');
			
			var liEle = document.getElementsByClassName('review_li_same');
			for (var i = 0; i < liEle.length; i++) {
  					
			document.querySelector('.review_update_' + (i + 1)).addEventListener('click', function () {
				console.log(this);
				updateTitle.value = $(this).parents('#review_box').find(".review_title_same").text();
				updateContent.value = $(this).parents('#review_box').find(".review_write_content_same").text();
				updateBox.style.display = "block";
				
				// 팝업 컨트롤용 변수
		        let popNumTitle = 1;

		        document.getElementById('update_title').onclick = function () {
		            if (popNumTitle == 1) {
		                alert('제목은 1~20자 사이로만 입력해주세요(공백포함)');
		                popNumTitle++;
		            }
		        }

				// 팝업 컨트롤용 변수
		        let popNumContent = 1;

		        document.getElementById('update_content').onclick = function () {
		            if (popNumContent == 1) {
		                alert('내용은 1글자 이상 입력해주세요(공백포함)');
		                popNumContent++;
		            } 
		        }
				
				// ajax용 기존 후기글 제목
				var originTitle = $(this).parents('#review_box').find(".review_title_same").text();
				
				$('#update_btn').on('click', function () {
			        // 제목 & 내용 글자 수 유효성 검사
			        // 후기 수정 버튼(제출) 이벤트 등록
		            // 1. 제목(1~20자 사이만 입력가능, 공백포함)
		            var textEle = document.getElementById('update_title');

		            // 2. 내용(최소 1글자 입력, 공백포함)
		            var textAreaEle = document.getElementById('update_content');

		            if (textEle.value.length > 20 || textEle.value.length == 0) {
		                alert('제목의 글자수를 맞춰서 입력해주세요');
						return false;
		            } else if(textAreaEle.value.length == 0) {
		                alert('내용은 최소 1글자 이상 입력해주세요');
						return false;
		            }
					console.log("update 시작");
					$.ajax({
						type : "post",
						url : "writememberupdate",
						data : {
							title : originTitle,
							update_title : updateTitle.value,
							update_content : updateContent.value,
							id : "${memberLoginInfo}"
						},
						dataType : "json",
						success : function (data) {
							console.log("success 시작");
							if (data.result == 1) {
								alert('수정을 완료했습니다.');
								document.getElementById('update_box').style.display = "none";
								location.reload();
								// window.location.reload();
							} else {
								alert('수정이 되지 않았습니다.');
							}
						},
						error : function(request,status,error) {
		                	console.log("false 진입")
		                    alert('수정 실패');
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                }
					})
				})
			})
   				}
		// ======================================================================
        // update 창 닫는 이벤트
	        var modal = document.getElementById('update_box');
	        window.onclick = function(event) {
                if (event.target == modal) {
                	var bool = confirm('후기 작성을 취소하시곘습니까?');
                	if (bool == true) {
                		modal.style.display = "none";	
					}
	            }
	        }
		// ======================================================================
		// 처음 페이지 로드 했을 때 삭제 / 수정 보이게 하기
			window.onload = function () {
   				var liEle = document.getElementsByClassName('review_li_same');
   				for (var i = 0; i < liEle.length; i++) {
   					if ("${memberLoginInfo}" == $('.review_writer_' + (i + 1)).text()) {
   	   					$('.btns_' + (i + 1)).css('display', 'block');
   					}	
				}
			}
		// ======================================================================
		// 후기 작성용 data 전달 by JSON
        document.getElementById('insertA').onclick = function() {
            var insertFrm = document.getElementById('insertForm');

            let jsData = {
                category : "<%=product.getProductCategory() %>",
                pno : "<%=product.getProductNo() %>",
                url : "<%=product.getProductImgUrl() %>",
               	pname : "<%=product.getProductName() %>"
            }
            
            let jsonData = JSON.stringify(jsData);

            $('#test').val(jsonData);
            console.log(JSON.stringify(jsData));

            insertFrm.method = "post";
            insertFrm.action = "writememberinsertview";
            insertFrm.submit();
        }
	// ======================================================================
	// 옵션 선택
/* 	// class 생성용 변수
    let optNumOne = 1;

    // 색깔 select 노드 생성
    let colorSelectEle = document.createElement('select');

    // 사이즈 select 담는 size_div
    let size_div = document.getElementById('size_div');

    // 사이즈 select
    let sizeSelect = document.getElementById('size_select');
    // let sizeValue = sizeSelect.value; // cf) 얘는 그냥 String이다. dom이 아니다.

    // 색깔 select 담는 color_div
    let color_div = document.getElementById('color_div');

    // li를 담는 ul
    let opt_table = document.getElementById('productChoiceTable');

    // 상품 가격
    const price = document.getElementById('price').innerText;

    // 상품 가격 담은 <h3> 태그
    let priceEle = document.getElementById('price');

    
    function show() {
        if (sizeSelect.value == "SM" || sizeSelect.value == "M" || sizeSelect.value == "L" || sizeSelect.value == "XL") {
            // 색깔 select 노드 생성
            colorSelectEle.setAttribute('class', 'color_select_same color_select_' + optNumOne);

            // 색깔 select에 option 추가
            colorSelectEle.innerHTML = '<option value="">Select Option</option>';
            colorSelectEle.innerHTML += '<option value="">------------------------</option>';
            colorSelectEle.innerHTML += '<option value="RED">RED</option>';
            colorSelectEle.innerHTML += '<option value="BLUE">BLUE</option>';
            colorSelectEle.innerHTML += '<option value="GREEN">GREEN</option>';
            colorSelectEle.innerHTML += '<option value="NAVY">NAVY</option>';
            color_div.appendChild(colorSelectEle);

            trMake();
        } else {
            console.log('오류가 났다.');
        }
    }
//====================================================================================
        // 사이즈 & 색상 선택 완료시 <li> 태그 하나씩 추가
        function trMake() {
            var colorSelectVal = document.querySelector('.color_select_' + optNumOne);
            var colorSelectValBefore = document.querySelector('.color_select_' + (optNumOne - 1));

            colorSelectVal.onchange = function() {
                if (colorSelectVal.value != "") {

                    // 사이즈를 선택하지 않고 색상 선택시 옵션 선택 금지
                    if (sizeSelect.value.length == 0) {
                        alert('사이즈를 선택해주세요');
                        return false;
                    }

                    // 사이즈, 색상, 수량을 담은 tr 생성
                    var trEle = document.createElement('tr');

                    trEle.setAttribute('class', 'opt_tr_same opt_tr_' + optNumOne);
                    trEle.innerHTML += "<td class=size_opt>" + sizeSelect.value + "</td>";
                    trEle.innerHTML += "<td class=color_opt>" + colorSelectVal.value + "</td>";
                    opt_table.appendChild(trEle);

                    let numInputEle = document.createElement('input');

                    numInputEle.setAttribute('type', 'number');
                    numInputEle.setAttribute('min', 1); // 최소 표시 숫자 지정
                    numInputEle.setAttribute('max', 99999); // 최대 표시 숫자 지정
                    numInputEle.setAttribute('step', 1); // 숫자 간격 지정
                    numInputEle.setAttribute('value', 1); // 초기 표현값
                    numInputEle.setAttribute('class', 'count_class_same count_class_' + optNumOne);
                    numInputEle.setAttribute('id', 'count_' + optNumOne);
                    trEle.appendChild(numInputEle);
                    trEle.innerHTML += '<td><button class="close_same ' + 'close_'+ optNumOne + '">&times;</button></td>';

                    // x를 누르면 해당 옵션줄(tr)울 삭제
                    // 삭제된 옵션줄의 가격도 총 가격에서 자동으로 minus
                    var closeEle = document.getElementsByClassName('close_same');
                    for (let i = 0; i < closeEle.length; i++) {
                        closeEle[i].onclick = function () {
                            // 옵션 줄 삭제
                            this.parentElement.parentElement.remove();
                            // 가격 자동 minus
                            priceEle.innerText = priceEle.innerText - this.parentElement.previousElementSibling.value * price;
                        }
                    }

                    optNumOne++;
                    // 같은 사이즈의 다른 색깔을 선택하는 경우를 대비해 사이즈 선택 <select>의 value를 ""로 초기화
                    sizeSelect.value = "";
                    firstPrice();
                }
            }
        }
//====================================================================================
        // <tr> 태그 하나씩 추가될때마다 숫자 증량칸(<input>) 생성
        // & 주문 수량에 따른 실시간 총 가격 변화
            function firstPrice() {
                var priceCnt = document.getElementsByClassName('count_class_same');
                var priceAll = 0;
                
                // 증감 안 했을때 총 가격(모든 옵션을 딱 1개씩만 주문할 때)
                for (let i = 0; i < priceCnt.length; i++) {
                    priceAll += priceCnt[i].value * price;
                    priceEle.innerText = priceAll;
                }
                console.log("priceAll 전전 : " + priceAll);
                console.log("priceAll 후후 : " + priceAll);
                
                // 상품 수량 증가에 맞춰 총 가격도 증가하는 이벤트
                for (let j = 0; j < priceCnt.length; j++) {
                    priceCnt[j].onchange = function () {
                        priceAll = priceAll * 1 + price * 1;
                        priceEle.innerText = priceAll;
                    }
                }
        } */
    </script>
</body>
</html>