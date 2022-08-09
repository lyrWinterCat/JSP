<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	PersonVO vo = new PersonVO();
    	vo.setName("홍길동");
    	vo.setAge(20);
    	request.setAttribute("vo",vo);
    	
    	PersonVO vo1 = new PersonVO();
    	vo1.setName("박길동");
    	vo1.setAge(30);
    	
    	List<PersonVO> list = new ArrayList<PersonVO>(); 
    	list.add(vo);
    	list.add(vo1);

    	request.setAttribute("list",list);
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	객체가 하나일 경우   <br>
	이름 : ${vo.name } 또는 ${requestScope.vo.name }<br>
	나이 : ${vo.age } 또는 ${requestScope.vo.age }<br>


<hr>
	ArrayList에 담아서 출력 <br>
	이름 : ${list[0].name } <br>
	나이 : ${list[0].age }

</body>
</html>