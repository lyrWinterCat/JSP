<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 서블릿에서 정보 두 개가 넘어왔다는 것을 알아야 가져다가 쓸 수가 있음.
	지금 그런 상황이 아니게 되어버렸다....
	
	뭘 가져와야하지..?  
	+ el표기법을 사용할 것이기 때문에 파라미터를 scope 영역에 담아서 사용을 해야 한다.-->

	제목 : ${title}<br>
	<img src="upload/${filename}" width="200">
	

</body>
</html>