<%@page import="vo.GogekVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	InitialContext ic = new InitialContext();
	Context ctx = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn = dataSource.getConnection(); 
	
	String sql = "select * from gogek";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<GogekVO> gogek_list = new ArrayList<GogekVO>();
	while(rs.next()){ 
		GogekVO vo = new GogekVO();
		vo.setGobun(rs.getInt("gobun"));  
		vo.setGoname(rs.getString("goname"));  
		vo.setGoaddr(rs.getString("goaddr"));  
		vo.setGojumin(rs.getString("gojumin"));  
		vo.setGodam(rs.getInt("godam"));  
		
		gogek_list.add(vo);
	}

	rs.close();
	pstmt.close();    	
	
	conn.close();  
    
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
			<th>고객 번호</th>
			<th>고객 이름</th>
			<th>고객 주소</th>
			<th>고객 주민번호</th>
			<th>고객 담당 번호</th>		
		</tr>
		
		<% for(int i=0; i<gogek_list.size(); i++) {
			GogekVO gv = gogek_list.get(i); %>
		<tr>
			<td><%= gv.getGobun() %></td>
			<td><%= gv.getGoname() %></td>
			<td><%= gv.getGoaddr() %></td>
			<td><%= gv.getGojumin() %></td>
			<td><%= gv.getGodam() %></td>
		</tr>	
		<%} %>
	
	</table>

</body>
</html>