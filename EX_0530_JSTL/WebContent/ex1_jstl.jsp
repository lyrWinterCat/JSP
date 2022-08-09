<%@page import="java.util.Date"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- c(core) : if, choose, forEach와 같은 제어문을 사용할 수 있게 해주는 라이브러리 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- fmt(format) : 출력 형식(날짜, 숫자)을 사용할 수 있게 해주는 라이브러리 -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <% //스크립트릿
    // c 라이브러리 관련 jstl
    	int num=10;    	
    	request.setAttribute("n", num);
    	
    	List<String> array = new ArrayList<>();
    	array.add("서울");
    	array.add("대전");
    	array.add("대구");
    	
    	request.setAttribute("array", array);
    	
    	UserVO u1 = new UserVO();
    	u1.setIdx(1);
    	u1.setName("홍길동");
    	UserVO u2 = new UserVO();
    	u2.setIdx(2);
    	u2.setName("박길동");
    	
    	List<UserVO> uList = new ArrayList<UserVO>();
    	uList.add(u1);
    	uList.add(u2);
    	
    	request.setAttribute("list", uList);    	
    	
    %>
    
    <%
    // fmt 라이브러리 관련 jstl
    	int money = 120000000;
    	Date today = new Date();
    	
    	request.setAttribute("money", money);
    	request.setAttribute("today",today);
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	* JSTL (JSP Standard Tag Library)
	: 연산이나 조건문, 반복문 (if/for문) , db관리 등을
	편리하게 처리할 수 있는 것
	 -->
	 
	 <!-- test 영역 안에 조건식이 들어감 -->
	 <!-- elseif / else가 없음. 조건이 여러개라면 조건을 여러개 달아주어야 함 -->
	<c:if test="${n eq 10}">
		<!-- 출력하기 (거의 안씀 // 겉멋!) -->
		<c:out value="참"/> <br>
		
		<!-- 이렇게만 써도 참이라고 잘 나옴 -->		
		참 <br>
	</c:if>
	<hr>	
	
	<!-- choose 영역 내부에는 주석 넣지 말것 !! 에러남!! -->
	<!-- elseif/else 구문의 역할. 여러개의 조건을 줄 때는 if보다 choose를 쓰는 것이 효율적 -->
	<!-- c:when 의 test 안에 조건식 적어주기 >> elseif 구문 역할-->
	<!-- c:otherwise >> else 구문 역할 -->
	<c:choose>	
		<%-- choose문에 주석을 넣고 싶다면 이걸로! --%>
		<c:when test="${param.msg eq 10}">나는 10이야~~</c:when>
		<c:when test="${param.msg eq 11}">나는 11이야~~</c:when>
		<c:otherwise> 모두 아니야! </c:otherwise>
	</c:choose>
	
	<hr>	
	 		<!-- for(int i=0; i<5; i++ -->
	 <!-- c:forEach var : begin : 시작값 / end : 끝값 / step : 증가값  -->
	 <!-- var : for문에서 i를 담은 것처럼, 값을 담을 변수 -->
	 <c:forEach var = "i" begin="1" end="5" step="1">
	 
	 	<!-- i%2==1이라면 다음 구문 출력 을 주는 조건식 -->
	 	<c:if test="${i mod 2 == 1}">
		 	<font color = "red">안녕하세요(${ i })<br></font>	 	 	
	 	</c:if>
	 
	 </c:forEach>
	 
	 <hr>
	 
	 <!-- for(String s : array) 향상된 포문과 같은 반복문 출력 -->
	 <!-- cnt.count : 순번 1,2,3
	 	cnt.index : 0부터 시작하는 index 번호 -->
	 <c:forEach var = "s" items ="${array}" varStatus="cnt">
	 	${cnt.count} / ${s} ----------------${cnt.index}/${s} <br> 
	 </c:forEach>
	 
	 <hr>
	 
	 <c:forEach var="u" items="${list}">
	 	${u.idx} / ${u.name } <br>
	 </c:forEach>
	 
	 <hr>
	 
	 fmt 라이브러리 관련<br>
	 <%-- <fmt:formatNumber>안에다가 값을 넣으면 에러!</fmt:formatNumber> --%>
	  	<fmt:formatNumber value="${money}"/> <br>
	 	<fmt:formatDate value="${today}"/> <br>
	 	<fmt:formatDate value="${today}" pattern="yyyy년MM월dd일"/> <br>
	 	<!-- DD : 1월 1일부터 오늘까지 경과된 일수 
	 		mm : 현재 시각의 분이 나옴-->
	 	
		 

</body>
</html>