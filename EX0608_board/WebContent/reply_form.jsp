<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send_check(){
		var f = document.f;
		
		//유효성검사
		if(!f.subject.value){
			alert("제목을 입력해주세요.");
			return;
		}
		if(!f.name.value){
			alert("작성자를 입력해주세요.");
			return;
		}
		if(!f.content.value){
			alert("내용을 입력해주세요.");
			return;
		}
		if(!f.pwd.value){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		f.submit();
	}
	
	//reply.do?subject=000&&name=000&&content=00.... 라는 식으로 form안의 데이터가 reply.do로 넘어감

</script>
</head>
<body>
<form name="f" method="post" action="reply.do">
<input type="hidden" name="idx" value="${param.idx}">
<input type="hidden" name="page" value="${param.page}">
	<table border="1">
		<caption>::: 댓글 쓰기 :::</caption>
		<tr>
			<th>제목</th>
			<td><input name="subject" style="width:370px"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input name="name" style="width:370px"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50" style="resize:none;"></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="pwd" type="password"></td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- img에서는 메서드 시 this.form을 사용할 수 없음 -->
				<img src="img/btn_reg.gif" onclick="send_check()">
				<img src="img/btn_back.gif" onclick="location.href='board_list.do'">				
			</td>
		</tr>
		
	
	</table>
	
</form>

</body>
</html>