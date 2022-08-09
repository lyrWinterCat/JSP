<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function find(){
		// where절이 있는 쿼리문 작성
		// 선택된 값을 가져와서 sawon_list.do로 값을 넘긴다 0~50
		
		var deptno=document.getElementById("deptno").value;
		
		location.href="sawon_list.do?deptno="+deptno;
		
		
	}



</script>

</head>
<body>	

<div align="center">

	<select id="deptno">
		<option value="0">:::부서를 선택하세요:::</option>
		<option value="10">총무부</option>
		<option value="20">영업부</option>
		<option value="30">전산실</option>
		<option value="40">관리부</option>
		<option value="50">경리부</option>	
	</select>
	<input type="button" value="검색" onclick="find()">

</div>
<br>

<table border="1" align="center">
		<caption>:::사원 목록 :::</caption>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직책</th>
			<th>급여</th>
			<th>입사일</th>
		</tr>
		
		<!-- ${list}를 쓰기 위한 servlet 만들기 -->
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.sabun}</td>
				<td>${vo.saname}</td>
				<td>${vo.sajob}</td>
				<td>${vo.sapay}</td>
				<c:set var="sahire" value="${vo.sahire}"/>
				<td>${fn:split(sahire,' ')[0]}</td>
			</tr>
		</c:forEach>
	
	
	</table>

</body>
</html>