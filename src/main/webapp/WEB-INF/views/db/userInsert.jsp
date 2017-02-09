<%@page import="org.zerock.persistence.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="org.zerock.persistence.User"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<jsp:useBean id="dao" class="org.zerock.persistence.UserDAOImpl"></jsp:useBean>

<%
	out.print("<script>");
	out.print("console.log('success')");
	out.print("<script>");
%>
</body>
</html>