<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	a{text-decoration : none;}
	table{border-collapse : collapse;}


</style>

</head>
<body>
	<table border="1" width="700">
		<tr>
			<td colspan="5"><img src="img/title_04.gif"></td>
		</tr>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th width="120">작성자</th>
			<th width="100">작성일</th>
			<th width="60">조회수</th>
		</tr>
		
		<c:forEach var="vo" items="${list}">
			<tr>
				<td align="center">${vo.idx}</td>
				
				<td>
				<c:if test="${vo.del_info ne -1}">
					<c:forEach begin="1" end="${vo.depth}">&nbsp;&nbsp;</c:forEach>
					<!-- 댓글 기호 -->
					<c:if test="${vo.depth ne 0}">└</c:if>
					
					<a href="view.do?idx=${vo.idx}&page=${param.page}">
						<font color="black">${vo.subject}</font>
					</a>
				</c:if>
				<c:if test="${vo.del_info eq -1}">
					<font color="gray">${vo.subject}</font>	
				</c:if>
				</td>				
				
				<td>${vo.name}</td>
				
				<!-- 삭제된 글 일 경우 날짜 삭제 -->
				<c:if test="${vo.del_info ne -1}">
				<td>${ fn:split(vo.regdate, ' ')[0]}</td>
				</c:if>
				<c:if test="${vo.del_info eq -1}">
				<td>알 수 없음</td>
				</c:if>
				
				
				<td align="center">${vo.readhit}</td>		
			</tr>		
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">
				<!-- 페이지 이동 버튼 자리잡기 -->
				<!-- ◀&nbsp;1&nbsp;2&nbsp;3&nbsp;▶ -->
				${pageMenu}
				
			</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<img src="img/btn_reg.gif" onclick="location.href='insert_form.jsp'"
				style="cursor:pointer;">
			</td>
		</tr>
	
	
	</table>
	
	

</body>
</html>