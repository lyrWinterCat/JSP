<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function send(f){
			var name = f.name.value.trim();
			var kor = f.kor.value.trim();
			var eng = f.eng.value.trim();
			var mat = f.mat.value.trim();
			
			// 유효성체크
			if(name == ''){
				alert("이름을 입력하세요")
				return
			}
			
			var num = /^[0-9]{1,3}$/;
 			if(!num.test(kor) || kor <0 || kor>100){
				alert("세자리 이하의 정수만 입력하세요")
				return
			}
			
			if(!num.test(eng) || eng <0 || eng>100){
				alert("세자리 이하의 정수만 입력하세요")
				return
			}
			if(!num.test(mat) || mat <0 || mat>100){
				alert("세자리 이하의 정수만 입력하세요")
				return
			} 
			
			f.action="register.jsp";
			f.submit();
		}
	</script>
	
	<style>
	table{border:2px solid black;
		border-collapse:collapse;}
	tr{height : 30px;}
	td{width : 110px;
	text-align : center;}
	</style>
</head>
<body>
<form>
	<table border=1>
		<caption>학생정보를 입력하세요</caption>
		<tr>
			<th>이름</th>
			<td><input name="name"></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><input name="kor"></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><input name="eng"></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><input name="mat"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" onclick="send(this.form);">
				<input type="button" value="취소" onclick="location.href='student.jsp'">
			</td>
		</tr>
		
	</table>
	
</form>
</body>
</html>