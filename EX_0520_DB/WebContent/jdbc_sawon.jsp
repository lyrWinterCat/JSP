<%@page import="vo.SawonVO"%>
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
    // DB연결 , 데이터 가져와서 ArrayList에 담기까지 수행
    
    	InitialContext ic = new InitialContext();
    	Context ctx = (Context)ic.lookup("java:comp/env");
    	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
    	Connection conn = dataSource.getConnection();    	
    	
    	System.out.println("----연결성공----");
    	
    	// 파라미터 값 가져오기  *외우면 좋음 * request.getParameter(String) 
    	int no = Integer.parseInt(request.getParameter("deptno"));
    	
    	// 명령 처리 객체 얻어오기
    	// (파라미터로 넘어온 부서번호에 대한 모든 사원에 대한 정보 호출) >> 동적인 값 가졍괴
    	String sql = "select * from sawon where deptno=" + no;

    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	
    	ResultSet rs = pstmt.executeQuery();
    	
    	List<SawonVO> sawon_list = new ArrayList<SawonVO>();
    	while(rs.next()){ 
    		SawonVO vo = new SawonVO();
    		vo.setDeptno(rs.getInt("deptno"));
    		vo.setSabun(rs.getInt("sabun"));
    		vo.setSajob(rs.getString("sajob"));
    		vo.setSaname(rs.getString("saname"));   
    		
    		sawon_list.add(vo);
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
			<th>부서 번호</th>
			<th>사원 번호</th>
			<th>사원 직위</th>
			<th>사원 이름</th>
		</tr>
		
		<% for(int i=0; i<sawon_list.size(); i++) {
			SawonVO sv = sawon_list.get(i);%>
			<tr>
				<td><%=sv.getDeptno()%></td>
				<td><%=sv.getSabun()%></td>
				<td><%=sv.getSajob()%></td>
				<td><%=sv.getSaname()%></td>			
			</tr>			
			
		<%} %>	
	
	</table>

</body>
</html>