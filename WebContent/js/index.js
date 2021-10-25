/**
 * 
 */
window.onload = function() {
	//================================================================
	// 서브 캐러샐 위치시키기
	var boxText = ["first", "second", "third", "four", "five", "six"];

  	for (var i = 1; i <= 6; i++) {
  		if (i == 3) {
  			// 중간 광고의 위치를 바꾸고 싶으면 (i == 3)의 숫자를 바꾸면 된다.
  			var centerDiv = document.getElementById('mainad_sec');
  			document.querySelector('#carousel_container').appendChild(centerDiv);
		}
		var divEle = document.createElement('div');
		divEle.setAttribute('class', "slide slide_" + i);
		document.querySelector('#carousel_container').appendChild(divEle);
		for (var j = 1; j <= 12; j++) {
			var idEle = $('#' + boxText[i - 1] + "_box_" + j);
			$(".slide_" + i).prepend(idEle);
		}	
	}
	//================================================================
	// 버튼 만들기
	for (var i = 1; i <= 6; i++) {
		var divEle = document.createElement('div');
		divEle.setAttribute('class', "slideBtn slideBtn_" + i);
		document.body.appendChild(divEle);
		
		// btn1
		var btn1 = document.createElement('button');
		btn1.setAttribute('class', "btn1");
		document.querySelector(".slideBtn_" + i).appendChild(btn1);
		
		// btn2
		var btn2 = document.createElement('button');
		btn2.setAttribute('class', "btn2");
		document.querySelector(".slideBtn_" + i).appendChild(btn2);
		
		// btn3
		var btn3 = document.createElement('button');
		btn3.setAttribute('class', "btn3");
		document.querySelector(".slideBtn_" + i).appendChild(btn3);
	}
	//================================================================
	// 버튼 이동
	for (var i = 1; i <= 6; i++) {
		var $btn = $('.slideBtn_' + i);
		$('.slide_' + i).after($btn);	
	}
	//================================================================
	// 버튼 이벤트	
    for (let i = 1; i <= 6; i++) {
        document.querySelector('.slideBtn_' + i + " .btn2").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(-100vw)';
        })
        
        document.querySelector('.slideBtn_' + i + " .btn3").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(-200vw)';
        });
        
        document.querySelector('.slideBtn_' + i + " .btn1").addEventListener('click', function() {
            this.parentNode.previousElementSibling.style.transform = 'translate(0vw)';
        });
    }
}