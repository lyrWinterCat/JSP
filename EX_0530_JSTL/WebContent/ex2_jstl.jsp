<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%
    	List<String> dosi = new ArrayList<>();
    	
    	dosi.add("서울");
    	dosi.add("경기");    
    	dosi.add("인천");
    	dosi.add("대전");
    	dosi.add("대구");
    	dosi.add("부산");
    	
    	request.setAttribute("dosi", dosi);
    	
    	// 홀수번 index만 출력    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="i" items="${dosi}" varStatus="cnt">
		<c:if test="${cnt.index mod 2 eq 1 }">
			${cnt.index} / ${i} <br>
		</c:if>
	
	</c:forEach>

</body>
</html>