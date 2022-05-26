<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// register.jsp=?name=홍길동&kor=90&eng=80&mat=77 >> 값이 넘어옴
    String name = request.getParameter("name");
    int kor = Integer.parseInt(request.getParameter("kor"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int mat = Integer.parseInt(request.getParameter("mat"));
    
    //db에 추가할 정보를 vo에 묶어주기
    SjVO vo = new SjVO();
    vo.setName(name);
    vo.setKor(kor);
    vo.setEng(eng);
    vo.setMat(mat);
    
    int res= SjDAO.getInstance().insert(vo);
    if(res==1){
    	response.sendRedirect("student.jsp");
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이동완료~~
</body>
</html>