<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Pet's</title>
  </head>
  <body>
<div style="height: 20%; width: 100%; text-align: center;">
		<div id="shopimg">
			<div style="border-bottom: 1px solid #cccccc;">
				<h3>비밀번호 찾기</h3>
			</div>
			<br>
		</div>
	</div>
     <div style="text-align: center;">
			<%
				CustomerDTO dto = (CustomerDTO) session.getAttribute("search_info");
				String user_name = dto.getCname();
				String user_pw = dto.getPw();
				
				if(user_name.equals("-1")){
			%>
			<p style="margin-top: 30px; margin-bottom: 30px;">
			등록되지 않은 회원 정보입니다.
		</p>
		<%
			} else {
		%>
			<p style="margin-top: 30px;">
			[<%=user_name%>]님의 비밀번호는
			[<%=user_pw%>]입니다.
		</p>
		<%} %>
		<input type="submit" class="btn" onclick="closeWin();" value="창닫기">

		</div>
	</center>
 <script>
		function closeWin() {
			window.close();
		}
	</script>
  </body>
</html>