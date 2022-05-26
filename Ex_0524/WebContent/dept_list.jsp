<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // DB연결 끝
    	DeptDAO dao = DeptDAO.getInstance();
    	List<DeptVO> list = dao.selectList();    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<caption>부서 목록</caption>
	<tr>
		<th>부서 번호</th>
		<th>부서 이름</th>
		<th>부서 위치</th>			
	</tr>
	<% for(int i=0; i<list.size(); i++) { 
		DeptVO dv = list.get(i); %>
	<tr>
		<td><%= dv.getDeptno() %></td>
		<td><%= dv.getDname() %></td>
		<td><%= dv.getLoc() %></td>			
	</tr>
	<% } %>	
	
	</table>

</body>
</html>