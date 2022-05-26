<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	SawonDAO dao = SawonDAO.getInstance();
    	List<SawonVO> sawon_list = dao.selectList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<th>사원 번호</th>
			<th>사원 이름</th>
			<th>부서 번호</th>
			<th>사원 직종</th>
			<th>입사 날짜</th>
		
		</tr>
		<% for(int i=0; i<sawon_list.size(); i++) {
			SawonVO sv = sawon_list.get(i);%>
		<tr>
			<td><%=sv.getSabun() %></td>
			<td><%=sv.getSaname() %></td>
			<td><%=sv.getDeptno() %></td>
			<td><%=sv.getSajab() %></td>
			<td><%=sv.getSahire() %></td>		
		</tr>
		<% } %>	
	</table>

</body>
</html>