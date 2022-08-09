<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    String name=request.getParameter("name");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String email = request.getParameter("email");
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function update(f) {
			//f.method="post"; >> 나중에 프로젝트용. (주소창에 넘기는 값 표기X)
			f.action="member_modi.jsp";
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
		<input type="hidden" name="idx" value="<%= idx %>">
	<table border=1>
		<caption>멤버 정보 수정</caption>
		<tr>
			<th>이름</th>
			<td><input name="name" value="<%= name %>"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input name="id" value="<%= id %>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="pwd" value="<%= pwd %>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input name="email" value="<%= email %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" onclick="update(this.form);">
				<input type="button" value="취소" onclick="location.href='member.jsp'">
			</td>
		</tr>
		
	</table>	
</form>
</body>
</html>