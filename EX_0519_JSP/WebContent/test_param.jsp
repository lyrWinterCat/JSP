<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// JSP 내장객체 : 보이지는 않지만 JSP가 실행되면서 존재하는 객체
	// 이것들은 Servlet을 만들게 되면 service메서드에 존재하는 객체들이다.
	
	// request(요청처리객체)
	// response(응답처리객체)
	
	// ex01_jsp_input.jsp에서 넘겨준 세 개의 파라미터를 수신해보자!
	// text_param.jsp?m_name==00&age=00&tel=000; >> get 메서드로 받아오면 주소창을 통해 이렇게 넘어옴
	// 이를 쿼리스트링 형식이라고 한다. 쿼리스트링은 요청 페이지주소의 뒷편에 변수와 값을 연결하여 전달한다.
		
	String t_name = request.getParameter("m_name");
	int age = Integer.parseInt(request.getParameter("age")); // parameter로 넘어올 때 문자열로 넘어옴 >> 형변환 필요
	String tel = request.getParameter("tel");
		
	// 파라미터로 넘어오는 모든 값은 문자열이거나, 바이너리타입이다.
	// 파라미터 데이터는 위의 두 타입이 아닌 정수, 문자, 실수 타입 등으로 넘어오는 경우가 아예 없다!	
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%=t_name %> <br>
	나이 : <%=age %> <br>
	전화번호 : <%=tel %> <br>


</body>
</html>