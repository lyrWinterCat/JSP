<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// import : import 필요한 부분에 ctrl space + 마우스 더블클릭
	//ArrayList<PersonVO> pList = new ArrayList<>();

	// 이렇게 더 많이 씀. 보다 효율적
	List<PersonVO> pList = new ArrayList<>();
	
	// DB에서 두 명의 유저 정보를 가지고 와서 pList에 저장했다고 가정
	PersonVO p1 = new PersonVO(); //객체생성
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	PersonVO p2 = new PersonVO(); //객체생성
	p2.setName("독고길동");
	p2.setAge(30);
	p2.setTel("010-222-2222");
	
	pList.add(p1);
	pList.add(p2);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table{border:2px solid black;
		border-collapse:collapse;}
	tr{height : 30px;}
	td{width : 110px;
	text-align : center;}
	p{width : 300px;
	text-align : center;}
</style>

</head>
<body>
	<p> :::개인정보 목록::: </p>

	<table border=1>
	<tr>
		<th>이름</th>
		<th>나이</th>
		<th>전화번호</th>
	</tr>

	<% for(int i=0; i<pList.size(); i++) { %>
	<tr>
		<td><%= pList.get(i).getName() %></td>
		<td><%= pList.get(i).getAge() %></td>
		<td><%= pList.get(i).getTel() %></td>
	</tr>
	<% } %>
	</table>

</body>
</html>