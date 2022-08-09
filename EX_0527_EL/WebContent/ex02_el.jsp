<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	EL 산술 연산자 <br>
	<!-- \${1+1} >> \를 붙이면 el문 주석처리. 
	주석처리 구문 안이라도 간혹 인식하는 경우가 있으므로 꼭 주석처리를 해 줄 것!-->
	\${1+1}=${1+1} <br>
	\${2-1}=${2-1 } <br>
	\${3*2}=${3*2 } <br>
	\${10/3 }=${10/3 }=${10 div 3 } <br> 
	\${10%3 }=${10%3 }=${10 mod 3 } <br>
	<br>
	
	EL 관계(비교) 연산자<br>
	\${3 > 2 }=${3>2 } =${3 gt 2 }*부등호 왼쪽 값 기준 결과 호출<br>
	\${3>=2 }=${3>=2 }=${3 ge 2 } <br>
	\${3<2 }=${3<2 }=${3 lt 2 }<br>
	\${3<=2 }=${3<=2 }=${3 le 2 }<br>
	\${3==2 }=${3==2 }=${3 eq 2 }<br>
	\${3!=2 }=${3!=2 }=${3 ne 2 }<br>
	<br>
	
	EL 삼항연산자<br>
	<!-- 파라미터로 넘어온 값(ex02_el.jsp?msg="값이 있다") 있을때와 없을때를 비교 -->
	파라미터값 : ${param.msg eq null ? '그래 참이다' : '거짓이다' } <br>
	파라미터 값 : ${empty param.msg ? '그래 참이다' : '거짓이다'} <br>
	
	EL 논리 연산자 <br>	
	파라미터값 : 
	${empty param.msg || param.msg eq 10 } <br>
	파라미터값 :  
	${empty param.msg or param.msg eq 10 } <br>
	 <br>
	파라미터값 : 
	${empty param.msg && param.msg eq 10 } <br>
	파라미터값 : 
	${empty param.msg and param.msg eq 10 } <br>
	
	
	
	
	

</body>
</html>