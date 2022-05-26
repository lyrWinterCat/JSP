<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	SjDAO dao = SjDAO.getInstance();
    	List<SjVO> sj_list = dao.selectList();
    
    %>
<!DOCTYPE html>
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
	div{width : 600px;
	border-top : 1px solid silver;}

</style>

</head>
<body>
<div>
	<table border=1>
	<caption>학생 정보</caption>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>순위</th>
			<th>비고</th>
		</tr>
		<% for(int i=0; i<sj_list.size(); i++) {
			SjVO sv = sj_list.get(i);
/* 			int total=0;
			float avg=0; */%>
		<tr>
			<td><%=sv.getNo() %></td>
			<td><%=sv.getName() %></td>
			<td><%=sv.getKor() %></td>
			<td><%=sv.getEng() %></td>
			<td><%=sv.getMat() %></td>
			
			<!-- 여기서 작성하는 코드들은 새로고침만 해도 서버에 반영됨
			단, java 파일에서 수정하는 코드들은 서버를 재시작해야 반영됨 -->
<%-- 		<td><%= total=sv.getKor()+sv.getEng()+sv.getMat() %></td> --%>
<%-- 			<% total=sv.getKor()+sv.getEng()+sv.getMat(); %>
			<td><%=total %></td>
			
			<% avg=(float)total/3; %>		
			<td><%=String.format("%.1f",avg) %></td> --%>
			
			<!-- sungtb_view에서 새롭게 추가된 값 -->
			<td><%=sv.getTot() %></td>	
			<td><%=sv.getAvg() %></td>	
			<td><%=sv.getRank() %></td>	
			
			<!-- 비고란에 삭제 버튼 만들기 -->
			<td><input type="button" value="삭제"></td>
				
		</tr>
		<%} %>
	<!-- 추가 버튼 만들기 -->
	<tr>
		<td colspan="9" align="center">
			<input type="button" value="학생 정보 추가" onclick="location.href='sung_register.jsp'">
		</td>
	</tr>
	</table>
</div>
	

</body>
</html>