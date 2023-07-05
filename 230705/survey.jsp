<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>survey.jsp</title>
<style>
h1 { margin: 20px 30px; } 
fieldset { border-radius: 20px; margin: 20px;  width: 400px; height: 240px; }
button { background: white; border-radius: 10px; width: 200px; height: 40px; margin: 15px;}
		 
</style>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>

<script>
$(function(){	
	var place = ['성산일출봉','꽃지 해수욕장' ,'경상남도 남해 가천 다행이마을' ,
				 '부산 광안대교' ,'진해 경화역' ,'우포늪' ,'전남 신안 증도 염전' ,'설악산 신선대 공룡능선' ,
				 '울릉도 해안도로','제주도 섭지코지' ];			// 장소들을 palce 배열에 담는다.
	
	for( var i in place){					// for each를 사용해서 배열을 input에 담는다.
		$('#list').before('<label><input>' + place[i] +'</label><br>' );			// 닫는 태그는 안써도 적용이 된다.
	} 	
				 
	var inputs = $('input');   // 자주 쓰는 input을 가져와서 변수 inputs에 저장
				 
	 $(inputs).attr('type', 'radio');    // 1. 속성 지정, 모든 'input' 태그의 속성 type이 설정되었다.
	
	// $(inputs).attr('name', 'place');		// 모든 input 태그에 속성 name을 설정.
	
	 for( var i in place){				
			$(inputs[i]).attr('value', place[i]);		// input에 들어있는 값을 가져오기 위해 value값을 이름대로 설정.
		} 
	 
	 $('input').click(function () {								// input을 클릭했을시에 체크된 input 값을 확인할 수 있다.
		 // #top의 배경이 변경된다.
		 
		 
		 var selectedValues = new Array(); // 선택된 라디오 버튼들의 값들을 저장할 배열

		for( var i in $("input[type=radio]:checked")){
  			selectedValues.push($("input[type=radio]:checked").val()); // 선택된 라디오 버튼의 값을 배열에 추가
			
		}
		
		 
		//	 selectedValues.push('e');
			
		
		  console.log(selectedValues);
		 // fruits.push('peach');				// 배열의 끝으로 새로운 요소 추가
		 
		

			
		 
		 
		//console.log( $("input[type=radio]:checked").val());     // 체크된 값 가져오기
		//console.log( $("input[type=radio]:checked").length);     // 체크된 갯수 가져오기
		
	})
	// 인풋값이 클릭되면 top안에 ol을 만들어서 그안에 li를 만든다. 숫자로
	// 클릭한 순서대로 1. 값 ... 순서대로 표시되게 한다.
			 
	
}); // $ end

</script>
</head>
<body>
<h1>Let's Vote!</h1>

<form>
	<fieldset>
		<legend id="list">10 beautiful places to visit in Korea</legend>
		 <!--배열에 넣고 radio 로 돌린다? 선택을 하면 
		내 마음대로 탑쓰리 메뉴에 배경색이 바뀌고 선택한 값이 들어간다
		개별로 삭제되면 좋고 revote를 누르면 모두 삭제가 되고 
		아무것도 없는 상태에서 서버로 전송을 누르면 입력해주세요
		3개가 아닌 상태에서 서버로 전송 누르면 3개를 선택해주세요
		인풋 타입은 라디오로 폼태그로 만들고 네임 만든다. 보내는 곳은 survey.do로 이동, 필요하면 히든 -->
	</fieldset>
	<fieldset>
		<legend id="top">내 마음대로 TOP 3</legend>
		
	</fieldset>
	<button type="button" id="reBtn">ReVote</button>
	<button type="submit" id="suBtn">서버로 전송</button>
	
	
</form>


</body>
</html>
