<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- 로그인이 되어있는 상태인지를 검증하기 위한 jsp -->

<c:if test="${empty vo}"> <!-- vo가 비어있다는 것은 세션에 저장을 못했다는 것 !  -->
	<script>
		alert("로그인 후 이용해주세요");
		location.href="login_form.jsp";	
	</script>
</c:if>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 로그인을 확인하는 jsp입니다

</body>
</html>