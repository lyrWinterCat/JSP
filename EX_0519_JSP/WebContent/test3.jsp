<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 테이블을 이용하여 구구단을 1단부터 9단까지 출력하세요
    	// 헷갈리면 위에 먼저 포문 정의를 해놓고 html 태그를 하는 것이 나음
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{border:2px solid black;
		border-collapse:collapse;}
	tr{height : 30px;}
	td{width : 110px;
	text-align : center;}
</style>


</head>
<body>
<%-- 	<table border = 1>	
	<%for(int i=2 ; i<10; i++) { 
		for(int j = 1 ; j < 10 ; j++){ 	%>
			<tr>
			<%if(i==2){ %>
			
			<td> <%=i+"*"+j+"="+i*j %></td>
		<%}%>
			</tr>
	<%}%>
<%}%>	
	</table> --%>
	
	<table border=1>
	<% for(int i = 1; i<10; i++) {%>
	<tr>
		<%for (int j = 2; j<10; j++) { %>
		<td><%=j+" * "+i+" = "+i*j %></td>
		<%} %>
	</tr>
	<%} %>
	</table>



</body>
</html>