<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 수신시 인코딩(GET일 경우에는 상관없으나, POST로 받아올 때는 한글이 깨짐. )
    // 그러나 get/post 상관없이 습관적으로 인코딩을 처리해주는 코드를 써주는 것이 좋다.
    	request.setCharacterEncoding("utf-8");
    	
    // 파라미터는 항상 문자열로 값을 가져옴. 따라서 형변환 필요
    int no = Integer.parseInt(request.getParameter("no"));
    
    //SjDAO의 delete() 함수 처리
    int res = SjDAO.getInstance().delete(no);
    
    if(res>=1){
    	// 한 행이 바뀔때마다 res가 1씩 증가
    	response.sendRedirect("student.jsp");
    }
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>