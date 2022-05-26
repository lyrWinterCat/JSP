<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 전달하기</title>

	<script>
		function send( f ) {
			// form 태그 안의 내용들을 변수에 받아옴
			var name = f.m_name.value;
			var age = f.age.value;
			var tel = f.tel.value;
			
			//유효성 체크 메서드
			// 입력창에 입력이 정확히, 원하는 대로 들어왔는지 확인
			
			// 이름체크
			if(name==''){
				alert("이름을 입력하세요")
				f.m_name.focus(); // 해당 칸으로 커서포인트 주기
				return;
			}
			
			//나이체크
			var pattern = /^[0-9]*$/; //숫자 입력 정규표현식
			if(!pattern.test(age)){
				alert("나이는 정수로 입력하세요");
				f.age.focus();
				return;
			}
			if(age==''){
				alert("나이를 입력하세요");
				f.age.focus();
				return;
			}
			
			//번호 체크
			if(tel==''){
				alert("전화번호를 입력하세요");
				f.tel.focus();
				return;
			}
			
			
			
			f.action="test_param.jsp" ;//저장할 곳 지정
			f.submit(); // 전송
			
			
		}
	
	
	</script>
	
</head>
<body>
<!-- <form method="post">
	form 형식으로 데이터를 저장, 넘기는 방식으로는 메서드 get/post 가 있다.
	 get : 속도 빠름. 보안성 낮음(주소창에 넘기는 데이터값이 뜸) 전송량이 제한적
	 post : 속도 느림. 보안성 높음. 전송량에 제한 없음
 -->
	<form method="get" action="">
		이름 : <input name = "m_name"> <br>
		나이 : <input name = "age"> <br>
		전화 : <input name = "tel"> <br>
		
		<input type="button" value = "파라미터 전송" onclick="send(this.form)">
	
	</form>

</body>
</html>