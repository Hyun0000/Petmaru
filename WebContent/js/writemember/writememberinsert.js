/**
 *
 * // JSON 객체 저장	
 * ex) data = {"pno":"1","pname":"MONCHOUCHOU 10yrs Young Dog Frill Top Violet","category":"C","url":"http:\/\/marlonshop.com\/web\/product\/medium\/202109\/8b850806cacbd1dc2bada8006c8a9394.jpg"}
 */
window.onload = function() {
    	// 사진 경로 설정(사진 넣기)
    	let imgEle = document.getElementById('review_img');
    	imgEle.setAttribute("src", data.url);
    	
    	// 상품 이름 넣기
    	let pnameEle = document.getElementById('product_name');
    	pnameEle.innerText = data.pname;
    	
    	// category <Input> value 넣기
    	let categoryInput = document.getElementById('category');
    	categoryInput.value = data.category;
    	
    	// pno <Input> value 넣기
    	let pnoInput = document.getElementById('pno');
    	pnoInput.value = data.pno;
    	
    	// writer <Input> value 넣기
    	let writerInput = document.getElementById('writer');
    	writerInput.value = memberLoginInfo;
    	
    	// JSON 객체 전체 읽는 예시
    	console.log(data);
    	
    	// JSON 객체 특정 key의 value 읽는 예시
    	console.log("data.url : " + data.url);
    	console.log("data.pname : " + data.pname);
    	console.log("data.category : " + data.category);
    	console.log("data.pno : " + data.pno);
    	console.log("${memberLoginInfo} : " + memberLoginInfo);
    	//==========================================================================================
        // 등록하기 버튼 이벤트 지정(유효성 검사)
         document.getElementById('review_insert_btn').onclick = insertReview;

        // 등록하기 버튼 이벤트 함수 생성
        function insertReview() {
            // 등록 버튼용 boolean 변수
            let insertBool = true;

            // 제목 유효성 검사
            // 1~20자 이상(공백 포함)
            var titleEle = document.getElementById('title');
            if (titleEle.value.length < 1 || titleEle.value.length > 20) {
                alert("제목을 1~20자 이내로 작성해주세요");
                insertBool = false;
				return false; // 아래 경고 팝업창 안 뜨게 하기위해 return 설정
            }

            // 내용 유효성 검사
            // 최소 1글자 이상(공백 포함)
            var contnetEle = document.getElementById('content');
            if (contnetEle.value.length < 1) {
                alert("내용을 최소 1글자 이상 작성해주세요");
                insertBool = false;
				return false; // 아래 경고 팝업창 안 뜨게 하기위해 return 설정
            }

			// 파일 업로드 유효성 검사(무조건 사진을 한 개이상 등록해야한다.)
			var fileEle = document.getElementById('file');
            if (fileEle.value == "") {
                alert("사진을 꼭 등록해주세요");
                insertBool = false;
            } else {
				console.log("사진명? : " + fileEle.value);
			}

            // 모든 유효성 검사 통과하면 등록완료
            if (insertBool == true) {
            	// form 태그 가져오기
                var frmEle = document.getElementById('review_insert_form');
                
                frmEle.action = "writememberinsert";
                frmEle.method = "post";
                frmEle.submit();
                alert("등록되었습니다."); 
            }
        }
}