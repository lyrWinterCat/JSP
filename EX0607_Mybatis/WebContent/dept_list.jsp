<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>:::부서 목록 :::</caption>
		<tr>
			<th>부서 번호</th>
			<th>부서 이름</th>
			<th>부서 위치</th>
		</tr>
		
		<!-- ${list}를 쓰기 위한 servlet 만들기 -->
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.deptno}</td>
				<td>${vo.dname}</td>
				<td>${vo.loc}</td>
			</tr>
		</c:forEach>
	
	
	</table>

</body>
</html>