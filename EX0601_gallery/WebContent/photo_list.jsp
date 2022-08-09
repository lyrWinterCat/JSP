<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/photo.css" rel="stylesheet" type="text/css">

<!-- ajax 연결 + webContext에 js폴더에 httpRequest.js 넣어주기-->
<script src="js/httpRequest.js"></script>

<script>
	function del(f){
		var idx=f.idx.value;
		var pwd = f.pwd.value;
		var pwd2 = f.pwd2.value;
		var filename=f.filename.value;
		
		if(pwd!=pwd2){
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		
		if(!confirm("진짜 삭제하시곘습니까?")){
			return;
		}
		
		//ajax 사용해서 지워진 부분만 새로고침이 되도록 만들어보기
		
		// 삭제를 원하는 idx를 서버로 전송
		var url = "photo_del.do";
		
		// 글자가 깨지지 않게 하는 방븝
		var param="idx="+encodeURIComponent(idx)+"&filename="+f.filename.value;
		
		sendRequest(url,param,finRes,"POST");
	}
	// 콜백함수 정의
	function finRes(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			
			//문자열 형태의 Json 데이터를 실제 json 데이터로 파싱
			var json=eval(data);
			
			if(json[0].param=='yes'){
				alert("삭제 성공");
			}else{
				alert("삭제 실패");
			}
			
			location.href="list.do";
		}
	}
	
	function download(filename){
		location.href="download.do?dir=/upload/&filename="+filename;
	}
	
</script>

</head>

<body>
	<div id="main_box">
	
		<h1>::: PhotoGallery :::</h1>
		
		<div align="center" style="margin:10px;">
		<!-- 프로젝트를 할 때에는 파라미터를 넘길 상황이 올 수 있으므로 .do 로 넘기는 것이 편함!(.jsp보다 .do 사용 권장) 
		넘길 파라미터가 없는 경우는 .jsp로 넘겨도 상관 없음-->
			<input type="button" value="사진등록" onclick="location.href='insert_form.jsp'">		
		</div>
		
		<div id="photo_box">
			<c:forEach var="vo" items="${list}">
				<div class="photo_type">
					<img src="upload/${vo.filename}">
					
				<form>
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="hidden" name="pwd" value="${vo.pwd}">
					<input type="hidden" name="filename" value="${vo.filename}">
					
					<div class="title"> ${vo.title} </div>
					<div align="center">
						<input type="password" name="pwd2" size="5">
						<input type="button" value="down" onclick="download('${vo.filename}')">
						<input type="button" value="삭제" onclick="del(this.form)">
					</div>					
				</form>
					
				</div>
			</c:forEach>
		</div>	
	</div>

</body>
</html>