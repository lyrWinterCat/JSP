<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function search(){
		var search=document.getElementById("search").value.trim();
		
		location.href="gogek_list.do?search="+search;
		
	}

</script>


<body>
<div align="center">
	<input id="search" placeholder="검색어를 입력하세요">
	<input type="button" value="검색" onclick="search()">
</div>

<table border="1" align="center">
		<caption>:::고객 목록 :::</caption>
		<tr>
			<th>고객 번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>주민번호</th>
			<th>담당번호</th>
		</tr>
		
		<!-- ${list}를 쓰기 위한 servlet 만들기 -->
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.gobun}</td>
				<td>${vo.goname}</td>
				<td>${vo.goaddr}</td>
				<td>${vo.gojumin}</td>
				<td>${vo.godam}</td>
			</tr>
		</c:forEach>
</table>

</body>
</html>