<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function send(f){
			var title=f.title.value.trim();
			var photo = f.photo.value.trim();
			
			//유효성체크
			if(title==''){
				alert("제목을 입력하세요");
				return;
			}
			if(photo==''){
				alert("사진을 업로드하세요");
				return;
			}
			
			//서블릿 사용
			//000.jsp/upload.do?title=000&photo=000 파라미터 전달
			f.action="upload.do";
			f.submit();
			
			
		}
	
	</script>

</head>
<body>
	<!-- 파일 업로드 시 주의사항
		1) 무조건 form태그를 사용해야하며, 전송방식은 post !
		2) enctype="multipart/form-data" : 필수로 들어감
			enc(form태그의 파일 데이터를 전송할 때 사용하는 인코딩 기법)	
	 -->
	 
	 <form method="post" enctype="multipart/form-data">
	 
	 	제목 : <input name="title"> <br>
	 	첨부 : <input type="file" name="photo"> <br>
	 	<input type="button" value="업로드" onclick="send(this.form)">
	 
	 </form>

</body>
</html>