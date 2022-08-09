<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	var b_idCheck=false;
	function send(f){
		var id=f.id.value.trim();
		var pwd=f.pwd.value.trim();
		var name=f.name.value.trim();
		
		//유효성체크
		//db에서 not null로 만들었다고 해도 비워놓고 만들어버리면 500에러 발생
		// 이럴 경우 사용자는 왜 에러가 났는지 모르므로 사용자에게 알려줄 경고창 생성
		if(!b_idCheck){
			alert("아이디 중복체크를 해주세요");
			return;
		}
		
		if(pwd==''){
			alert("비밀번호를 입력해주세요");
			return;
		}
		if(name==''){
			alert("이름을 입력해주세요");
			return;
		}
		// 비밀번호를 보내기 때문에 주소창에 넘겨질 파라미터값 표시 되지 않도록
		f.method="POST";
		f.action="insert.do";
		f.submit();
		
	}//send메서드
	
	//아이디 중복체크를 위한 메서드
	function check_id(){
		var id=document.getElementById("id").value.trim();
		if(id==''){
			alert("아이디를 입력해주세요");
			return;
		}
		// 중복검사를 하고 새로고침을 한다면 input태그 안의 내용이 다 날라가서
		// 무한으로 중복체크만 해야함
		var url="check_id.do";
		//특수문자 깨짐 방지
		var param="id="+encodeURIComponent(id);
		
		//ajax로 구현
		sendRequest(url,param,resultFn,"POST");

	}//checkID
	
	//ajax에서 쓸 콜백함수
	function resultFn(){
		if(xhr.readyState==4&&xhr.status==200){
			var data=xhr.responseText; // "[{'res':'no'}]"
			
			// 문자열로 담겨진 data를 실제 json형태로 변환
			var json=eval(data);
			if(json[0].res=='no'){
				alert("이미 사용중인 아이디 입니다.");
				return;
			}else{
				//회원가입이 가능한 경우
				alert("사용 가능한 아이디 입니다.");
				b_idCheck=true;
			}
		}
		
	}
	
	// 아이디를 입력받는 입력상자의 값이 변환되면 호출되는 메서드
	function che() {
		b_idCheck=false;
	}


</script>

</head>
<body>
	<form>
		<table border="1">
			<caption>:::회원가입:::</caption>
		<tr>
			<th>이름</th>
			<td>
				<input name="name">
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input name="id" id="id" onchange="che()">
				<!-- 중복체크 버튼 -->
				<input type="button" value="중복 체크" onclick="check_id()">
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input name="pwd" type="password">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="가입" onclick="send(this.form)">
				<!-- 목록으로 클릭시 돌아갈 주소가 do인지 jsp인지 잘 판단해야 함! -->
				<input type="button" value="목록으로" onclick="location.href='member_list.do'">
			</td>		
		</tr>		
		
		</table>
	</form>

</body>
</html>