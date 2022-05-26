<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSP (Java Server Page) : 연산 능력을 갖고 있는 html  -->
    <% //스크립트릿(Scriptlet): jsp에서 자바 코드를 사용하고자 할 때 사용하는 영역
    	
    	// jsp가 web페이지로 전환되는 가정에서 만나는 Servlet클래스가 가진 객체이므로
    	// jsp에서는 Servlet 클래스가 허용하는 범위 안에서 객체를 마음대로 가져다가 쓸 수 있다.
    
    
   		String ip = request.getRemoteAddr(); //접속자의 ip주소를 얻어오기
   		int num = new Random().nextInt(5) +1; 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>&lt;%@ 내용 %&gt; : jsp헤더 - 실행시 인코딩, import 등을 위해서 반드시 지정해야 하는 영역</p>
	<p>&lt;% 자바코드 %&gt; : 스크립트 릿 - JSP에서 자바코드를 사용하고자 할 때 지정하는 영역</p>
	<p>&lt;%= 변수명 %&gt; : 스크립트 릿의 변수를 출력하는 출력코드 (=println)</p>
	<p>&lt;%= 변수명; %&gt; 과 같이 ;는 사용할 수 없다. *암기부분*</p>
	<%= ip %> 님 방문해주셔서 감사합니다.
	<br>
	<%= num %>

</body>
</html>