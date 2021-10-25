window.onload = function () {
	let category = document.getElementById('category_js').value;
	let productNo = document.getElementById('productNo_js').value;
	let productImgUrl = document.getElementById('productImgUrl_js').value;
	let productName = document.getElementById('productName_js').value;
	let startPageLink = document.getElementById('startPageLink_js').value;
	let endPageLink = document.getElementById('endPageLink_js').value;
	let memberLoginInfo = document.getElementById('memberLoginInfo_js').value;
	let PAGE_SIZE = document.getElementById('PAGE_SIZE_js').value;
	let payYN = document.getElementById('payYN_js').value;
	//================================================================
	//================================================================
	// 처음 페이지 load시 1page 분량 후기 data를 ajax로 가져오기
	$.ajax({
        type : "POST",
        url : "writememberreviewview",
        dataType : "json", // 받아들이는 (success : function (data)) data의 모양
		
        data : {
        	cateGory : category,
            reviewpage : 1
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
        			
        			$('.review_li_' + (i + 1)).css('display', 'block');
					/*$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);*/
					
					if(data.reviewInfo[i].reviewImageUrl.startsWith('http')) {
            			$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);
						console.log("http 경로로 사진 가져오기");
						console.log(data.reviewInfo[i].reviewImageUrl);
					} else {
						console.log("물리경로");
						console.log(data.reviewInfo[i].reviewImageUrl);
						$('.img_same_' + (i + 1)).attr("src", "/Petmaru/upload/" + data.reviewInfo[i].reviewImageUrl);
					}
					
					$('.review_title_' + (i + 1)).text(data.reviewInfo[i].reviewTitle);
        			$('.review_write_content_' + (i + 1)).text(data.reviewInfo[i].reviewContent);
        			$('.review_date_' + (i + 1)).text(data.reviewInfo[i].reviewDate);
        			$('.review_writer_' + (i + 1)).text(data.reviewInfo[i].reviewWriter);
        			
        			// 로그인한 회원과 후기 작성자가 일치하면 수정&삭제 버튼 보이기
   					if (memberLoginInfo == $('.review_writer_' + (i + 1)).text()) {
   	   					$('.btns_' + (i + 1)).css('display', 'block');
   						$('.review_update_same').text('수정');
   						$('.review_delete_same').text('삭제');
   					}
        		}
        			console.log("PAGE_SIZE 전 : " + PAGE_SIZE);
        			console.log("data.reviewInfo.length 전 : " + data.reviewInfo.length);
        			// 후기가 없는 부분을 임시적으로 숨기는 기능
   					for (let m = 5; m > data.reviewInfo.length; m--) {
   						console.log(123);
						$('.review_li_' + m).css('display', 'none');
						console.log(123);
					}
        			
        			// console.log("해결책? : " + ${PAGE_SIZE} * 1 - data.reviewInfo.length * 1);
        			console.log("해결책? : " + (PAGE_SIZE * 1 - data.reviewInfo.length * 1));
        			console.log("PAGE_SIZE : " + PAGE_SIZE);
        			console.log("data.reviewInfo.length : " + data.reviewInfo.length);
			}
		},
		error : function(request,status,error) {
        	console.log("false")
            alert('후기가 없습니다.');
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	})
	//================================================================
	//================================================================
	//================================================================
		// 후기 글을 가져오는 ajax
 			for (var i = startPageLink; i <= endPageLink; i++) {
 				console.log("pagelink 시작");
				$('.pageLink_' + i).on('click', function() {
					console.log("ajax시작");
					$.ajax({
		                type : "POST",
		                url : "writememberreviewview",
		                dataType : "json",
		                data : {
		                	cateGory : category,
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
		                			
		                			$('.review_li_' + (i + 1)).css('display', 'block');
									/*$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);*/
									
									if(data.reviewInfo[i].reviewImageUrl.startsWith('http')) {
			                			$('.img_same_' + (i + 1)).attr("src", data.reviewInfo[i].reviewImageUrl);
										console.log("http 경로로 사진 가져오기");
										console.log(data.reviewInfo[i].reviewImageUrl);
									} else {
										console.log("물리경로");
										console.log(data.reviewInfo[i].reviewImageUrl);
										$('.img_same_' + (i + 1)).attr("src", "/Petmaru/upload/" + data.reviewInfo[i].reviewImageUrl);
									}
									
									$('.review_title_' + (i + 1)).text(data.reviewInfo[i].reviewTitle);
		                			$('.review_write_content_' + (i + 1)).text(data.reviewInfo[i].reviewContent);
		                			$('.review_date_' + (i + 1)).text(data.reviewInfo[i].reviewDate);
		                			$('.review_writer_' + (i + 1)).text(data.reviewInfo[i].reviewWriter);
		                			
		                			// 로그인한 회원과 후기 작성자가 일치하면 수정&삭제 버튼 보이기
		           					if (memberLoginInfo == $('.review_writer_' + (i + 1)).text()) {
		           	   					$('.btns_' + (i + 1)).css('display', 'block');
		           						$('.review_update_same').text('수정');
		           						$('.review_delete_same').text('삭제');
		           					}
		                		}
		                			console.log("PAGE_SIZE 전 : " + PAGE_SIZE);
		                			console.log("data.reviewInfo.length 전 : " + data.reviewInfo.length);
		                			// 후기가 없는 부분을 임시적으로 숨기는 기능
  		           					for (let m = 5; m > data.reviewInfo.length; m--) {
		           						console.log(123);
										$('.review_li_' + m).css('display', 'none');
										console.log(123);
									}
		                			
		                			// console.log("해결책? : " + ${PAGE_SIZE} * 1 - data.reviewInfo.length * 1);
		                			console.log("해결책? : " + (PAGE_SIZE * 1 - data.reviewInfo.length * 1));
		                			console.log("PAGE_SIZE : " + PAGE_SIZE);
		                			console.log("data.reviewInfo.length : " + data.reviewInfo.length);
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
				console.log("title : " + $(this).parents('#review_box').find(".review_title_same").text());
				console.log("writer : " + $(this).parents('#review_box').find(".review_writer_same").text());
				console.log("imgSrc : " + $(this).parents('.review_li_same').find(".img_same").attr("src"));
				// 삭제 여부를 묻는 팝업
				let deleteBool = confirm('정말 삭제하시겠습니까?');
				if (deleteBool == true) {
				console.log("ajax 삭제 시작");
				$.ajax({
	                type : "POST",
	                url : "writememberdelete",
	                data : {
	                	title : $(this).parents('#review_box').find(".review_title_same").text(),
	                	writer : $(this).parents('#review_box').find(".review_writer_same").text(),
						imgSrc : $(this).parents('.review_li_same').find(".img_same").attr("src")
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
		
			// 수정할 후기 제목 <input>
			let updateTitle = document.getElementById('update_title');
			
			// 수정할 후기 내용 <textarea>
			let updateContent = document.getElementById('update_content');
			
			// 조건으로 사용될 기존 후기 제목 <input>
			let updateTitleOrigin = document.getElementById('update_title_origin');
			
			// 후기 수정 modal blx
			let updateBox = document.getElementById('update_box');
			
			// 기존 후기 사진 url 담을 <input>
			let imgUrlInput = document.getElementById('update_imgUrl');
			
			var liEle = document.getElementsByClassName('review_li_same');
			for (var i = 0; i < liEle.length; i++) {
  					
			$('.btns_' + (i + 1)).find($('.review_update_' + (i + 1))).on('click', function () {
				// 수정할 후기 제목
				updateTitle.value = $(this).parents('#review_box').find(".review_title_same").text();
				
				// 수정할 후기 내용
				updateContent.value = $(this).parents('#review_box').find(".review_write_content_same").text();
				
				// 조건으로 사용될 기존 후기 제목
				updateTitleOrigin.value = updateTitle.value; // servlet에 sql의 where 조건으로 보낼 title 값 설정
				
				// 기존 후기 사진 url
				imgUrlInput.value = $(this).parents('.review_li_same').find(".img_same").attr("src")
				
				// 수정 modal box 띄우기
				updateBox.style.display = "block";
				
				console.log("updateTitleOrigin.value(조건으로 넘길 기존 제목) : " + updateTitleOrigin.value);
				console.log("id(조건으로 넘길 user id) : " + document.getElementById('update_id').value);
				console.log("기존 후기 사진 url : " + imgUrlInput.value);
				// ==============================
				// 팝업 컨트롤용 변수
		        let popNumTitle = 1;

		        document.getElementById('update_title').onclick = function () {
		            if (popNumTitle == 1) {
		                alert('제목은 1~20자 사이로만 입력해주세요(공백포함)');
						// 팝업창이 딱 한 번만 보이게 하기위해 popNumTitle++ 설정
		                popNumTitle++;
		            }
		        }

				// 팝업 컨트롤용 변수
		        let popNumContent = 1;

		        document.getElementById('update_content').onclick = function () {
		            if (popNumContent == 1) {
		                alert('내용은 1글자 이상 입력해주세요(공백포함)');
						// 팝업창이 딱 한 번만 보이게 하기위해 popNumContent++ 설정
		                popNumContent++;
		            } 
		        }
				// ==============================
		        // 후기 수정 버튼(제출) 이벤트 등록
				$('#update_btn').on('click', function () {
					// 제출 버튼용 boolean
					let updateBool = true;
					
			        // 제목 & 내용 글자 수 유효성 검사
		            if (updateTitle.value.length > 20 || updateTitle.value.length < 1) {
			            // 1. 제목(1~20자 사이만 입력가능, 공백포함)
		                alert('제목의 글자수를 맞춰서 입력해주세요');
						updateBool = false;
		            } else if(updateContent.value.length == 0) {
			            // 2. 내용(최소 1글자 입력, 공백포함)
		                alert('내용은 최소 1글자 이상 입력해주세요');
						updateBool = false;
		            }

					if(updateBool == true) {
						console.log("update 시작");
						let updateForm = document.getElementById('update_form');
						updateForm.method = "post";
						updateForm.action = "writememberupdate"
						updateForm.submit();
					}
					})
				})
				//}
			/*})*/
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
			// window.onload = function () {
   				var liEle = document.getElementsByClassName('review_li_same');
   				for (var i = 0; i < liEle.length; i++) {
   					if (memberLoginInfo == $('.review_writer_' + (i + 1)).text()) {
   	   					$('.btns_' + (i + 1)).css('display', 'block');
   					}	
				}
			// }
		// ======================================================================
		// 후기 작성용 data 전달 by JSON
		if (payYN == 'Y') {
	        document.getElementById('insertA').onclick = function() {
				$.ajax({
					type : "POST",
					url : "writemembercheckwriter",
					dataType : "json",
					data : {
						userId : memberLoginInfo,
						category : category
					},
					success : function(data) {
						console.log("success : " + data);
						if(data.result == 0) {
							// result = 0 --> 구매는 했지만 후기룰 작성하지 않았다.
				            var insertFrm = document.getElementById('insertForm');

				            let jsData = {
				                category : category,
				                pno : productNo,
				                url : productImgUrl,
				               	pname : productName
				            }

				            let jsonData = JSON.stringify(jsData);
							console.log(jsonData);
				            $('#test').val(jsonData);
				            console.log(JSON.stringify(jsData));
				
				            insertFrm.method = "post";
				            insertFrm.action = "writememberinsertview";
				            insertFrm.submit();
						} else if(data.result == 1) {
							// result = 1 --> 구매를 했으며 이미 후기를 작성
							alert("이미 후기를 작성하셨습니다.");
						}
					},
					error : function(request,status,error) {
		                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                	console.log("false")
		                    alert('후기가 없습니다.');
							confirm("stop");
		                } 
				})
	        }
		}
		// ======================================================================
  		// 카테고리 = 'C'일 때 옵션 선택
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
		if(category == "C") {
		document.getElementById('size_select').onchange = function () {
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
                    upArrow.setAttribute('src', "/Petmaru/image/outline_arrow_drop_up_black_24dp.png");
                    
                    let downArrow = document.createElement('img');
                    downArrow.setAttribute('class', "arrow_down_same arrow_down_" + optNumOne);
                    downArrow.setAttribute('src', "/Petmaru/image/outline_arrow_drop_down_black_24dp.png");

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
                
				// category == "C" 일때 상품 수량
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

				// category == "C" 아닐때 상품 수량
				// * category == "C" 일때 (count_opt_not_c_text)가 null이 되는 것을 방지하기 위해 기본값("") 설정
				var count_opt_not_c_text = "";
				if(category != "C") {
					// category == "C" 아닐때 상품 수량 설정
					count_opt_not_c_text = document.getElementById('other_category_count_input').value;
				}
				
                // 총 가격
               	var priceLast = document.getElementById('price').innerText;
	
	            let js_buy_Data = {
					category : category,
	                pName : productName,
	                url : productImgUrl,
	                option_size : size_text,
	                option_color : color_text,
	                count : count_text,
					count_opt_not_c : count_opt_not_c_text,
	                price : priceLast
	            }
	            
				// category == "C" 일때 옵션 유효성 검사
            	if(category == 'C') {
					if(size_text == "" || color_text == "") {
						alert("옵션을 모두 선택해주세요");
						return false;
					}
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
// 다른 카테고리 상품 옵션
// 수량 표시칸 (input)
	if(category != 'C') {
	    let count_input = document.getElementById('other_category_count_input');
	
	    document.getElementById('count_increase').onclick = function () {
	        count_input.value++;
	        priceEle.innerText = price * count_input.value;
	    }
	
	    document.getElementById('count_decrease').onclick = function () {
	        count_input.value--;
	        priceEle.innerText = priceEle.innerText - price * 1;
	        if (count_input.value < 1) {
	            alert('최소 주문 수량은 1개입니다.');
	            count_input.value = 1;
	            priceEle.innerText = price;
	            return false;
	        }
	    }
	}
}