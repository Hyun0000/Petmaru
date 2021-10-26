/**
 * 
 */

// typeFunc() function을 인라인 방식으로 등록했기에 onload event 외부에 등록
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

window.onload = function() {
			console.log(memberLoginInfo);
	
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
	    			   id : memberLoginInfo
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
	   			   id : memberLoginInfo
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
	   			   id : memberLoginInfo
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
/*        var textareaEle = document.getElementById('need_textarea');
        var selectEle = document.getElementById('need_select');


        function typeFunc(e) {
            if (e.value == "typing") {
                textareaEle.style.display = "block";
                // selectEle.style.display = "none";
            } else {
                textareaEle.style.display = "none";
                selectEle.style.display = "block";
            }
        }*/

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
					return false;
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
            
			if(nullCheckC(addressEle) == false) {
				return;
			}
			
			if(nullCheckC(phoneEle) == false) {
				return;
			}
			
			if(nullCheckC(nameEle) == false) {
				return;
			}
            
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
				return false;
            }

            // 2. 이름
            var nameRegExp = /^[가-힣a-zA-Z]{2,10}$/;
            if (!nameRegExp.test(nameEle.value)) {
            	payBool = false;
                alert('이름을 올바르게 입력해주세요');
				return false;
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
				return false;
            }

            // (2). 현금영수증 번호 입력 정규식 검사
            // 현금 영수증 번호 입력칸이 보이면 정규식 체크 진행

            let pointPhoneEleValue = pointPhoneEle.value; // 현금 영수증 번호 입력칸의 value
            if (pointPhoneEle.style.display == 'inline-block') {
                if (!phoneRegExp.test(pointPhoneEleValue)) {
                	payBool = false;
                    alert('핸드폰 번호를 올바르게 입력해주세요');
					return false;
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

        //=====================================================================
       	// 로그아웃 시 [구매자 정보] 입력값 삭제
       	let idEle = document.getElementById('buyer_name');
       	let phoneEle = document.getElementById('buyer_phone');
       	
/*       	if (${empty memberLoginInfo}) {
       		idEle.value = "";
       		phoneEle.value = "";
		}*/
}