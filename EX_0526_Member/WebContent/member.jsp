<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDAO dao = MemberDAO.getInstance();
    List<MemberVO> member_list = dao.selectList();    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script>
	function del(idx){
		if(!confirm("진짜로 삭제하시겠습니까?")){
			return;
		}
		// 주소창에 파라미터 같이 보내기
		location.href="member_del.jsp?idx="+idx;
	}
	function modify(idx,name,id,pwd,email){
		location.href="member_update.jsp?idx="+idx+"&name="+name+"&id="+id+"&pwd="+pwd+"&email="+email;
	}
</script>

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
	<caption>::회원목록::</caption>
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>			
			<th>비고</th>			
		</tr>
		<% for(int i=0; i<member_list.size(); i++) {
			MemberVO mv = member_list.get(i); %>
		<tr>
			<td><%=mv.getIdx() %></td>
			<td><%=mv.getName() %></td>
			<td><%=mv.getId() %></td>
			<td><%=mv.getPwd() %></td>
			<td><%=mv.getEmail() %></td>
			<td><input type="button" value="삭제" onclick="del('<%=mv.getIdx()%>')">
			<input type="button" value="수정" onclick="modify('<%=mv.getIdx()%>','<%=mv.getName()%>','<%=mv.getId()%>','<%=mv.getPwd()%>','<%=mv.getEmail()%>')"> <!--  member_update.jsp 로 값 보내주기  -->
			</td>			
		</tr>
		<% }%>
	
	</table>
	<input type="button" value="추가" onclick="location.href='member_regist_form.jsp'">
	
</div>

</body>
</html>