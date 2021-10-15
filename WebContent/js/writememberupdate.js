window.onload = function() {
		// ======================================================================
		// 후기 수정 관련
        // 제목 글자수 제한 팝업창 이벤트
        let popNumTitle = 1;

        document.getElementById('update_title').onclick = function () {
            if (popNumTitle == 1) {
                alert('제목은 1~20자 사이로만 입력해주세요(공백포함)');
                popNumTitle++;
            } 
        }

        // 내용 글자수 제한 팝업창 이벤트
        let popNumContent = 1;

        document.getElementById('update_content').onclick = function () {
            if (popNumContent == 1) {
                alert('내용은 1글자 이상 입력해주세요(공백포함)');
                popNumContent++;
            } 
        }

        // 제목 & 내용 글자 수 유효성 검사
        // 후기 수정 버튼(제출) 이벤트 등록
        document.getElementById('update_btn').addEventListener('click', function () {

            // 1. 제목(1~20자 사이만 입력가능, 공백포함)
            var textEle = document.getElementById('update_title');

            // 2. 내용(최소 1글자 입력, 공백포함)
            var textAreaEle = document.getElementById('update_content');

            // 3. form 태그
            var frmEle = document.getElementById('update_form');

            if (textEle.value.length > 20 || textEle.value.length == 0) {
                alert('제목의 글자수를 맞춰서 입력해주세요');
				return false;
            } else if(textAreaEle.value.length == 0) {
                alert('내용은 최소 1글자 이상 입력해주세요');
				return false;
            }
 
			// ajax를 쓰기에 이 부분을 주석처리
			// else {
            //  frmEle.action = "writememberupdate";
            //  frmEle.method = "post";
			//  frmEle.submit();
            //  alert('수정이 완료됐습니다.');
            // }
        })
}