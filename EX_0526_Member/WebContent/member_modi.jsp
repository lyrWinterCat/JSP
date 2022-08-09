<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    String name=request.getParameter("name");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String email =request.getParameter("email");
    
    MemberVO vo = new MemberVO();
    vo.setIdx(idx);
    vo.setName(name);
    vo.setId(id);
    vo.setPwd(pwd);
    vo.setEmail(email);
    
    int res = MemberDAO.getInstance().update(vo);
    
    if(res>=1){
    	response.sendRedirect("member.jsp");
    } 
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>