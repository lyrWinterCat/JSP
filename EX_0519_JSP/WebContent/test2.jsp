<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // DB에서 다섯개의 과일 목록을 가지고 왔다고 가정
    	String [] fruits = {"사과","포도","딸기","바나나","복숭아"};
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	
	<%--<li> <%= fruits[0] %></li>
		<li> <%= fruits[1] %></li>
		<li> <%= fruits[2] %></li> 
	이런식으로 한줄한줄 추가할 수도 있지만, 변수가 많아지면 비효율적
	--%>
	
 		<%-- JSP 주석 . !-- 를 써도 상관은 없음. ctrl + shift + /--%>
		<% for(int i = 0; i<fruits.length; i++) { 
			// 여기는 자바영역이라(스크립트 릿) html tag를 쓸 수 없음 %>
			<li> <%=fruits[i] %> </li>
			
		<% } // 이런식으로 자바영역, html영역을 따로따로 구분해서 주어야 함%>
		 

	</ul>
	

</body>
</html>