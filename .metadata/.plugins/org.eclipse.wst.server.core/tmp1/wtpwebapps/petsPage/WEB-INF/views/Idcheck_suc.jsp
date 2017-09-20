<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pet's</title>
</head>
<body>
	<div style="height: 20%; width: 100%; text-align: center;">
		<div id="shopimg">
			<div style="border-bottom: 1px solid #cccccc;">
				<h3>아이디 중복 확인</h3>
			</div>
			<br>
		</div>
	</div>
	<div style="text-align: center;">
		<%
			String user_id = request.getParameter("id");
			if (request.getAttribute("result").equals(false)) {
				session.setAttribute("checkedId", false);
		%>
		<p style="margin-top: 30px; margin-bottom: 30px;">[<%=user_id%>]는 사용할 수 있는 아이디 입니다.</p>
		<%
			} else {
				session.setAttribute("checkedId", true);
		%>
		<p style="margin-top: 30px;">
			[<%=user_id%>]
		</p>
		<p style="margin-bottom: 30px;">[<%=user_id%>]는 사용할 수 없는 아이디 입니다.</p>
		<%
			}
		%>
		<input type="submit" class="btn" onclick="closeWin();" value="창닫기">

	</div>
	<script>
		function closeWin() {
			window.close();
		}
	</script>

</body>
</html>