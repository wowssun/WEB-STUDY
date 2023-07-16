// /resources/js/script.js


// 로그아웃 
function logout(){
	if(confirm('로그아웃 하시겠습니까?')){
		location.href="../common/logout.jsp";
	}
}

function checkProduct(){
	
	// 상품코드는 P로 시작하고 숫자를 포함하여 5 ~ 10자
	var pidPtn = /^P\d{4,9}$/;
	
	// 상품의 이름은 영어, 숫자, _, -, 공백, 한글 가능
	var pnamePtn = /^[\w|가-힣|\-|\s]{1,20}$/;
	
	// 상품 가격은 숫자만 가능, 음수는 X, 소수점 둘째 자리까지만
	var pricePtn = /\d/;
	var pricePointPtn = /^\d+(?:[.]?[\d]?[\d])?$/;    // 플러스 앞은 정수자리고 소수점 뒤부터 숫자가 2개까지를 지정하는것
	
	// 재고수량 : 숫자만 가능
	var stockPtn = /\d/;
	
	
	// 이렇게 코드를 쓰면 의의 표현식과 같은지 확인한다.
	if(!pidPtn.test($('#pid').val())){
		alert('[상품 코드]' + '\nP와 숫자를 조합하여 5 ~ 10자로 입력해주세요.'
		+ '\n첫 글자는 반드시 P로 시작!');
		$('#pid').focus();
	}else if(!pnamePtn.test($('#pname').val())){  // 상품명
		alert('[상품명]' + '\n20자 이내로 입력해주세요.' + '\n특수문자는 -, -, 공백만 가능');
		$('#pname').focus();
		
	}else if(!pricePtn.test($('#price'))){   // 상품 가격 - 숫자     // 이거 알림창 뜨는 거 완료해오기

	}else if(!($('#price').val() > 0)){  // 상품가격 - 음수

	}else if(!stockPtn.test($('#'))){   // 상품 가격 - 소수점 둘째자리

	}else if(!stockPtn.test($('#stock'))){  // 재고 수량 - 숫자

	}else{
	
		//폼 전송
		$('form').submit();
	}	

}

// 상품삭제 (productEdit.jsp)
function remove (pid) {
		if(confirm('상품을 삭제하시겠습니까?')){
			location.href='productRemoveProc.jsp?pid='+ pid;
		}
	}	
	
