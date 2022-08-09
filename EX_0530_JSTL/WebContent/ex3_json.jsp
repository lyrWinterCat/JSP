<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- JSON(JavaScript Object Notation) 표기법 
    - 서로 다른 프로그램에서 데이터를 교환하기 편리하도록 
    	규격화된 표기법  
    	
    	ex) 네이버에서 어떠한 값을 받아왔을 때 , system마다 사용하는 언어가 다를 경우
    	(서버) 0000 (DB)
    	
    	자바(web) / 안드로이드(앱) / C언어 / ios 등이 서버에 요청을 할 때
    	서버는 4가지 언어로 대답을 해주어야 하는가? >> nope
    	공용어인 JSON 방식으로 대답을 해 주는 개념
    	
    	 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// json 선언시 '' 안에 선언
	var p = {'name':'홍길동' , 'age':20 , 'tel' : '010-1111-1111'};
	document.write("이름 : "+p.name+"<br>");
	document.write("나이 : "+p.age+"<br>");
	document.write("전화번호 : "+p.tel+"<br>");
	// key값만 찾으면 원하는 value값을 찾을 수 있는 단일 JSON
	
	document.write("<hr>");
	
	// json 1차원 배열
	var p_arr=[{'name':'일길동','age':30},
		{'name':'이길동','age':40}];
	
	document.write(p_arr[0].name+" / "+p_arr[0].age+"<br>");
	document.write(p_arr[1].name+" / "+p_arr[1].age+"<br>");	
	
	//json 다차원 배열
	var course = {'name':'웹앱개발',
			'start':'2022-03-15',
			'end':'2022-08-07',
			'sub':['java','jsp','spring'],
			'student':[{'name':'홍길동','age':20},
				{'name':'김길동','age':30}]};
	
	document.write("<hr>");
	document.write("과목명 : "+ course.name + "<br>");
	document.write("시작일 : "+ course.start + "<br>");
	document.write("종료일 : "+ course.end + "<br>");
	
	// sub의 과목명에 접근은 index로 접근
	document.write("과목명 "+ course.sub+"<br>");
	document.write("과목명 "+ course.sub[0]+" , "+ course.sub[1]+" , "+ course.sub[2]+"<br>");
	
	document.write("학생들 : "+course.student[0].name+" / "+course.student[0].age+"<br>");
	


</script>

</head>
<body>


</body>
</html>