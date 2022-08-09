<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Ajax(Asynchronus JavaScript and XML 
	: 자바스크립트를 이용한 백그라운드 통신기술 (비동기 통신)
	ex) 네이버 로그인 시 로그인창 부분만 바뀌어서 해당 아이디의 블로그/메일 등이 뜨는 부분 창 변화 >> 부분새로고침
	
	* 오늘 배운거 복습 잘 하기 *
	
	-->
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- script사이 영역에는 어떠한 내용도 적어서는 안된다!  
: 참조 전용 스크립트 영역-->
<script src="js/httpRequest.js"></script>

<!-- 스크립트를 통해 넘길 값이 있다면 script를 하나 더만들어서 넘기기 -->
<script>
	function send() {
		/* document.getElementById("아이디") >> element를 아이디로 받아오기. 꼭 기억 ! */
		var dan = document.getElementById("dan").value;
		
		var url = "gugudan_ajax.jsp";
		var param="dan="+dan;
		
		
		// 위에 참조스크립트 영역으로 등록했기 때문에 사용이 가능한 메서드
		// httpRequest.js 보면 sendRequest가 정의되어있음
		// url : 우리가 만든 url , param : 우리가 만든 dan , callBack : 콜백함수(상황에 맞게 만들기), method : get or post (파라미터 전달타입)
		sendRequest(url,param,resultFn,"GET");
	}
	
	//콜백함수 만들기
	function resultFn(){
		// 클릭시 함수호출 확인
		//alert("call back");
		
		// 사이트 연결 확인
		//console.log(xhr.readyState + " / " + xhr.status);
		//xhr.readyState
		// 0 : 초기화 오류
		// 1,2,3 : 로딩중
		// 4 : 콜백메서드 로딩 완료
		
		// xhr.status
		// 200 : 이상없음
		// 404 , 500 : 서버에 이상이 있음
		
		// 도착한 데이터 읽어오기
		var data = xhr.responseText;
		//alert(data);
		document.getElementById("disp").innerHTML = data;
	}

</script>


</head>
<body>
	단 : <input id="dan">
		<input type="button" value="결과보기" onclick="send();"> <br>
		
		<div id="disp">
		
		</div>

</body>
</html>