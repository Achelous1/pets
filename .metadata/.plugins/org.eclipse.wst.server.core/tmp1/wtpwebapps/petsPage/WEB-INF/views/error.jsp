<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>error page</title>
</head>
<body>
<% 
String errorMessage = (String)request.getAttribute("error_message");
%>
실행도중 오류가 발생 했습니다.<br>
오류 내용 
<%= errorMessage%>
<p>
<a href = "index.jsp">메인 페이지로 이동</a>
</p>
</body>
</html>