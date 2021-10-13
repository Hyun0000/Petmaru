/**
 * 
 */
function pressEnter() {
    var nullCheckRegE = /\s/g; // 공백 체크 정규표현식 - 탭, 스페이스

    if (window.event.keyCode == 13) {
        let inputEle = document.getElementById('keyword');
        let inputVal = inputEle.value;
        inputVal = inputVal.replace(/(\s*)/g, ""); // 검색어 사이의 공백 제거
        
        if (inputVal == "" || inputVal.match(nullCheckRegE)) {
            console.log(inputEle.value);
            alert('검색어를 입력해주세요');
            return false;
        } else {
            var frm = document.getElementById('keyward_submit');
            frm.action = "/Petmaru/productsearch";
            frm.method = "GET";
            frm.submit();
        }
    }
}