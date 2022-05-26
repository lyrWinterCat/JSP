<%@page import="vo.DeptVO"%>
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
    	// 톰캣이 JNDI(java naming and directory interface)를 검색하기 위해 필요한 클래스
    	InitialContext ic = new InitialContext();
    	
    	// Resource 위치 검색
    	// context.xml 안의 resource 인식 또는 컴퓨터 내의 모든 resource
    	// lookup 안에 들어갈 주소는 자바에서 DB Resource를 인식하기 위한 주소. 단 하나.
    	Context ctx = (Context)ic.lookup("java:comp/env");
    	
    	// 검색된 Resource를 통해 필요한 JNDI의 자원(Resource)를 검색
    	// lookup()안에 들어갈 주소 =context.xml 파일의 Resource영역에 참조되어있는 name 속성값
    	// name 속성값 의미 : 여기로 온다면, context.xml에서 설정한 username,password로 로그인해줄게! 
    	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
    	
    	// 위에서 준비해 둔 경로로 로그인 시도(접속)
    	Connection conn = dataSource.getConnection();
    	
    	//--------------------------여기 위 까지가 db연결부분------------------------------------
    	
    	System.out.println("----연결성공----");
    	
    	// 명령 처리객체 얻어오기 / sql문 정의. 나중에는 전용 클래스 하나 생성해서 sql 클래스로 관리할 것
    	String sql = "select * from dept";
    	
    	// 문자열로 된 쿼리문(sql문)을 진짜 쿼리문으로 인식하게 해주는 객체
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	
    	// 줄바꿈객체 (실행된 sql문장을 통해 얻어진 결과를 실제로 VO 객체에 담아준다. 읽어온 데이터를 한줄씩 읽고 다음 줄로 띄어줌) 
    	ResultSet rs = pstmt.executeQuery();
    	
    	List<DeptVO> dept_list = new ArrayList<DeptVO>();
    	while(rs.next()){ //진짜로 줄을 바꿔주는 메서드. 값이 있다면 다음줄 출력, 없다면 탈출
    		DeptVO vo = new DeptVO();
    		
    		// 현재 필드값을 vo에 담아주기
    		vo.setDeptno(rs.getInt("deptno"));
    		vo.setDname(rs.getString("dname"));
    		vo.setLoc(rs.getString("loc"));
    		// >> 번호 이름 지역 순으로 db에서 받아온 값을 array에 추가  		
    		
    		dept_list.add(vo);
    	}
    	// DB 접속과 관련된 모든 객체는 생성된 역순으로 반드시 닫아주어야 함!
    	rs.close();
    	pstmt.close();    	
    	
    	conn.close();
    
    %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	// send 메서드 정의해주기
		function send(data){
			var f = document.getElementById("m_form");
			var hid = document.getElementById("hid");
			hid.value = data;
			f.submit();
		}
	</script>
	
<meta charset="UTF-8">
<title>DB연동 후 부서 테이블 출력하기</title>
</head>
<body>
	<form id="m_form" action = "jdbc_sawon.jsp">
	<table border=1>
		<tr>
			<th>부서 번호</th>
			<th>부서명</th>
			<th>부서 위치</th>		
		</tr>
		
		<% for(int i=0; i<dept_list.size(); i++) { 
/* 			dept_list.get(i).getDeptno();
			dept_list.get(i).getDname();
			dept_list.get(i).getLoc(); */
			
			DeptVO dv = dept_list.get(i); %>
			
			<tr>
				<td><%= dv.getDeptno() %></td>
				<td>
				<!-- 부서 이름에 링크 걸어놓기  
				클릭시 설정해 놓은 주소로 이동.
				input 태그와 연결해서 필요값이 해당 input으로 가도록 설정-->
					<a href="javascript:send('<%=dv.getDeptno() %>');" name="deptno">
						<%= dv.getDname() %>
					</a> 
					</td>
				<td><%= dv.getLoc() %></td>			
			
			</tr>
			
		<% } %>	
	
	</table>	
	
	<!-- input 임시 값 저장소. a태그와 send 메서드를 이어주는 부분 -->
	<input type="hidden" value="" id="hid" name="deptno">
	
	</form>

</body>
</html>