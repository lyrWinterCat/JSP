<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- 로그인이 되었을 경우 접근 가능한 화면 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="check_login.jsp"/> <br>
	메인 페이지 입니다. <br>
	
	${vo.name} 님 로그인을 환영합니다.
	<input type="button" value="로그아웃" onclick="location.href='logout.do'">

</body>
</html>