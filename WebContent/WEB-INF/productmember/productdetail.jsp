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
       <section id="detail_section">
       	<div id="detail_div_box">
	        <div id="product_img">
	            <img src="<%=product.getProductImgUrl() %>">
	        </div>
	
	        <div id="product_write_icon">
	            <div id="write">
	                <h1><%=product.getProductName() %></h1>
	                <h4><%=product.getCom() %></h4>
	            </div>
	            
	            <div id="option">
                    <div id="size_div">
                        <select name="size" id="size_select" onchange="show();">
                            <option value="">Select Option</option>
                            <option value="">------------------------</option>
                            <option value="SM">SM</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                        </select>
                    </div>

                    <!-- 색깔 & 수량을 담는 div -->
                    <div id="color_div"></div>
                    
                    <!-- 선택완료된 전체 옵션을 담는 table -->
                    <table id="productChoiceTable">
                    	<tr id="option_introduce"><td>옵션을 선택해주세요</td></tr>
                    </table>
                    <!-- <ul id="productChoiceList"></ul> -->
                </div>

                <div id="price_div">
                    <h3 id="price"><%=product.getPrice() %></h3><span id="price-span">원</span>
                    <c:if test="${payYN == 'Y'}">
		                <!-- 특정 조건이 맞아야 후기 작성 버튼이 보이도록 수정 필요 -->
		                <!-- JSON을 이용해 data 전송 -->
		                <form id="insertForm">
		                <input type="hidden" id="test" name="test">
		                <button id="insertA">후기작성</button>
		              	</form>
	              	</c:if>
                </div>
	
	            <div id="buy_cart_btn">
	                <%-- <a href="<%=context_root%>/productbuy?pno=<%=product.getProductNo() %>" id="purchase">BUY</a> --%>
	                <form id="buy_form">
	                <button id="purchase">BUY</button>
	                <input type="hidden" id="buy_json" name="buy_json">
	                </form>
	                <a href="#" id="cart">CART</a>
	            </div>
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
			                            	<button class="review_update_same review_update_${k}">수정</button>
			                            	<button class="review_delete_same review_delete_${k}">삭제</button>
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
		                dataType : "json",
		                data : {
		                	cateGory : "<%=product.getProductCategory()%>",
		                    reviewpage : $(this).text()
		                },
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
					console.log("originTitle : " + originTitle);
					console.log("updateTitle.value : " + updateTitle.value);
					console.log("updateContent.value : " + updateContent.value);
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
		if (${payYN == 'Y'}) {
	        document.getElementById('insertA').onclick = function() {
	            var insertFrm = document.getElementById('insertForm');
	
	            let jsData = {
	                category : "<%=product.getProductCategory() %>",
	                pno : "<%=product.getProductNo() %>",
	                url : "<%=product.getProductImgUrl() %>",
	               	pname : "<%=product.getProductName() %>"
	            }
	            
	            let jsonData = JSON.stringify(jsData);
				console.log(jsonData);
	            $('#test').val(jsonData);
	            console.log(JSON.stringify(jsData));
	
	            insertFrm.method = "post";
	            insertFrm.action = "writememberinsertview";
	            insertFrm.submit();
	        }
		}
		// ======================================================================
		// 구매 페이지 이돟 data 전달 by JSON
 	        document.getElementById('purchase').onclick = function() {
	            var buyFrm = document.getElementById('buy_form');
            	
	            // 사이즈 정보 담기
                var size_buy_opt = document.getElementsByClassName('size_opt');
                var size_text = "";
                for (let i = 0; i < size_buy_opt.length; i++) {
                    if (i + 1 == size_buy_opt.length) {
                        size_text += size_buy_opt[i].innerText;
                    } else {
                        size_text += size_buy_opt[i].innerText + ", ";
                    }
                }
                
             	// 색상 정보 담기
                var color_buy_opt = document.getElementsByClassName('color_opt');
                var color_text = "";
                for (let i = 0; i < color_buy_opt.length; i++) {
                    if (i + 1 == color_buy_opt.length) {
                        color_text += color_buy_opt[i].innerText;
                    } else {
                        color_text += color_buy_opt[i].innerText + ", ";
                    }
                }
                
                // 총 수량 담기
                var count_opt = document.getElementsByClassName('count_class_same');
                var count_text = "";
                for (let i = 0; i < count_opt.length; i++) {
                	if (i + 1 == count_opt.length) {
                		count_text += count_opt[i].value;
                    } else {
                    	count_text += count_opt[i].value + ", ";
                    }
                }
                console.log("count_text : " + count_text);
                
                // 총 가격
               	var priceLast = document.getElementById('price').innerText;
	
	            let js_buy_Data = {
	                pName : "<%=product.getProductName() %>",
	                url : "<%=product.getProductImgUrl() %>",
	                option_size : size_text,
	                option_color : color_text,
	                count : count_text,
	                price : priceLast
	            }
	            
				if(size_text == "" || color_text == "") {
					alert("옵션을 모두 선택해주세요");
					return false;
				}
	            
	            let jsonBuyData = JSON.stringify(js_buy_Data);
				console.log(jsonBuyData);
	            $('#buy_json').val(jsonBuyData);
	            console.log(JSON.stringify(js_buy_Data));
	
 	            buyFrm.method = "post";
	            buyFrm.action = "productbuy";
	            
	            buyFrm.submit();
	        }
		// ======================================================================
		// 내용 없는 <li> 숨기는 이벤트
		/* var imgEle = document.getElementsByClassName('img_same');
		document.getElementById('page').onclick = function() {
			for (let i = 0; i < imgEle.length; i++) {
				console.log(imgEle[i]);
				console.log(imgEle[i].getAttribute('src'));
	            if (imgEle[i].hasAttribute('src')) {
	            	console.log("제발 좀 되라.");	
				}
	            
	            if (imgEle[i].getAttribute('src') == null) {
					$('.review_li_' + (i + 1)).css('display', 'none');
				} else {
					$('.review_li_' + (i + 1)).css('display', 'block');
				}
			}
        } */
	        // hasAttribute(“src”)
    	// ======================================================================
  		// 옵션 선택
 		// class 생성용 변수
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
	        	
	        	// "옵션을 선택해주세요" 문구 숨기기
	        	document.getElementById('option_introduce').style.display = 'none';
	        	
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
		// 사이즈 & 색상 선택 완료시 <tr> 태그 하나씩 추가
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

                    var trLength = document.getElementsByClassName('size_opt');
                    for (let i = 0; i < trLength.length; i++) {
                        if (document.getElementsByClassName('size_opt')[i].innerText == sizeSelect.value && document.getElementsByClassName('color_opt')[i].innerText == colorSelectVal.value) {
                            alert("이미 같은 옵션이 있습니다.");
                            return false;
                        }
                    }

                    // 사이즈, 색상, 수량을 담은 tr 생성
                    var trEle = document.createElement('tr');

                    trEle.setAttribute('class', 'opt_tr_same opt_tr_' + optNumOne);
                    trEle.innerHTML += "<td class=size_opt>" + sizeSelect.value + "</td>";
                    trEle.innerHTML += "<td class=color_opt>" + colorSelectVal.value + "</td>";
                    opt_table.appendChild(trEle);

                    let spanEle = document.createElement('span');
                    spanEle.setAttribute('class', 'count_span_same count_span_' + optNumOne);

                    let numInputEle = document.createElement('input');
                    numInputEle.setAttribute('type', 'text');
                    numInputEle.setAttribute('value', '1');
                    numInputEle.setAttribute('readonly', 'readonly');
                    numInputEle.setAttribute('class', 'count_class_same count_class_' + optNumOne);
                    numInputEle.setAttribute('id', 'count_' + optNumOne);

                    let upArrow = document.createElement('img');
                    upArrow.setAttribute('class', "arrow_up_same arrow_up_" + optNumOne);
                    upArrow.setAttribute('src', "<%=request.getContextPath() %>/image/outline_arrow_drop_up_black_24dp.png");
                    
                    let downArrow = document.createElement('img');
                    downArrow.setAttribute('class', "arrow_down_same arrow_down_" + optNumOne);
                    downArrow.setAttribute('src', "<%=request.getContextPath() %>/image/outline_arrow_drop_down_black_24dp.png");

                    // span에 수량 입력칸 & 위아래 화살표 담기
                    spanEle.appendChild(numInputEle);
                    spanEle.appendChild(upArrow);
                    spanEle.appendChild(downArrow);

                    // 위의 span을 tr에 담기
                    trEle.appendChild(spanEle);

                    // 'X' 마크 추가
                    trEle.innerHTML += '<td><button class="close_same ' + 'close_'+ optNumOne + '">&times;</button></td>';

                    // x를 누르면 해당 옵션줄(tr)울 삭제
                    // 삭제된 옵션줄의 가격도 총 가격에서 자동으로 minus
                    var closeEle = document.getElementsByClassName('close_same');
                    for (let i = 0; i < closeEle.length; i++) {
                        closeEle[i].onclick = function () {
                            // 옵션 줄 삭제
                            this.parentElement.parentElement.remove();
                            // 가격 자동 minus
                            priceEle.innerText = priceEle.innerText - $(this).parent().prev().find('input').val() * price;
                            
                            // 가격이 0원이 되면 다시 옵션 선택 문구 출력
                            if (priceEle.innerText == 0) {
                                document.getElementById('option_introduce').style.display = 'inline-block';
                            }
                        }
                    }

                    optNumOne++;
                    // 같은 사이즈의 다른 색깔을 선택하는 경우를 대비해 사이즈 선택 <select>의 value를 ""로 초기화
                    sizeSelect.value = "";
                    countPrice();
                }
            }
        }
//====================================================================================
        // <tr> 태그 하나씩 추가될때마다 숫자 증량칸(<input>) 생성
        // & 주문 수량에 따른 실시간 총 가격 변화
        function countPrice() {
            var priceCnt = document.getElementsByClassName('count_class_same');
            var priceAll = 0;
            
            // 증감 안 했을때 총 가격(모든 옵션을 딱 1개씩만 주문할 때)
            for (let i = 0; i < priceCnt.length; i++) {
            	console.log("priceCnt[i].value : " + priceCnt[i].value);
            	console.log("price 전 : " + price);
                priceAll += priceCnt[i].value * price;
                console.log("price 후 : " + price);
                console.log("priceAll : " + priceAll);
                priceEle.innerText = priceAll;
            }

            // 증가 버튼 눌렀을때 가격 변화
            let upArrow = document.getElementsByClassName('arrow_up_same');
            for (let i = 0; i < upArrow.length; i++) {
                upArrow[i].onclick = function () {
                    this.previousElementSibling.value++;
                    priceAll = priceAll * 1 + price * 1;
                    priceEle.innerText = priceAll;
                }
                
            }

            // 감소 버튼 눌렀을때 가격 변화
            let downArrow = document.getElementsByClassName('arrow_down_same');
            for (let j = 0; j < downArrow.length; j++) {
                downArrow[j].onclick = function() {
                    if (this.previousElementSibling.previousElementSibling.value <= 1) {
                        alert('최소 수량은 1개입니다.');
                        this.previousElementSibling.previousElementSibling.value = 1;
                        return false;
                    }
                    this.previousElementSibling.previousElementSibling.value--;
                    priceAll = priceAll * 1 - price * 1;
                    priceEle.innerText = priceAll;
                }
            }
        }
    </script>
</body>
</html>