<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script language="javascript">
	// �ڹ� ��ũ��Ʈ ����

	function deleteCheck() {
		var form = document.deleteform;

		if (!form.password.value) {
			alert("��й�ȣ�� �����ּ���");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>
<%
	int idx = Integer.parseInt(request.getParameter("idx")); /* view.jsp���� ���� idx���� ���� */
	int pg = Integer.parseInt(request.getParameter("pg"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Pet's</title>
</head>
<body>
<br>
	<div id="Nav_menu">
		<ul>
			<li><a href="./login.html"> �α��� </a></li>
			<li><a href="./join.html"> ȸ������ </a></li>
			<li>����������</li>
			<li>��ٱ���</li>
		</ul>
	</div>

	<br>

	<div id="Mainimg">
		<img src="./img/main.jpg" style="width: 50%; height: 30%;"></img>
	</div>

	<div id="shopimg">
		<div style="border-bottom: 1px solid #cccccc;">
			<h3>Q&A</h3>
		</div>
		</div>
		<br>
		<br>

		<center>
			<table>
				<form name=deleteform method=post action="delete_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
					<!-- table���ʿ� form�� �����ϰ� delete_ok�� idx���� �����ؼ� ���� -->
					<tr>
						<td>
						
							<table>
								<tr>
									<td>&nbsp;</td>
									<td align="center">��й�ȣ</td>
									<td><input name="password" type="password" size="50" maxlength="100"></td>
									<td>&nbsp;</td>
								</tr>
								<tr align="center"  height="50px">
									<td>&nbsp;</td>
									<td colspan="2">
									<input type=button class="btn" value="����" OnClick="javascript:deleteCheck();">
									<input type=button class="btn" value="���" OnClick="javascript:history.back(-1)">
									<td>&nbsp;</td>
								</tr>
							</table>
							
						</td>
					</tr>
				</form>
			</table>
			</center>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<legend></legend>
			<footer>
			<ul>
				<li>����</li>
			</ul>
			<ul>
				<li>��� ���۴�</li>
			</ul>
			<ul>
				<li>�����Ͻ�</li>
			</ul>

			<ul>
				<li>�������� ó����ħ</li>
			</ul>
			<ul>
				<li>���</li>
			</ul>
			<ul>
				<li>����</li>
			</ul>
			</footer>
</body>

</html>