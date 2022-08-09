<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	function del(idx){
		if(!confirm("정말 삭제하시겠습니까?")){
			//아니오 버튼 누를 시
			return;
		}
		
		var url="delete.do";		
		var param="idx="+encodeURIComponent(idx);
		
		sendRequest(url,param,delRes,"POST");
	}
	
	function delRes(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			
			//문자열 형태의 Json 데이터를 실제 json 데이터로 파싱
			var json=eval(data); //parsing
			
			if(json[0].param=='yes'){
				alert("삭제를 완료했습니다.");
			}else{
				alert("삭제에 실패했습니다.");
			}
			
			location.href="member_list.do";
		}
	}


</script>

<style>
	table {border-collapse:collapse;}
	th {width:200px; height:60px;}

</style>

</head>
<body>
	<table border="1">
		<tr>
			<td colspan="5" align="center">
				<input type="button" value="회원가입" onclick="location.href='member_insert_form.jsp'">
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>비고</th>
		</tr>
		
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.name}</td>
				<td>${vo.id}</td>
				<td>${vo.pwd}</td>
				<td><input type="button" value="삭제" onclick="del('${vo.idx}')"></td>
			</tr>
		</c:forEach>	
	
	</table>

</body>
</html>