<%@page import="com.pets.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.sql.*"%>
<script language="javascript">
	// �ڹ� ��ũ��Ʈ ����
<%!Connection conn;
	Statement stmt;
	ResultSet rs;
	DataSource ds;
	String query = "select * from board";%>
	function modifyCheck() {
		var form = document.modifyform;

		if (!form.password.value) {
			alert("��й�ȣ�� �����ּ���");
			form.password.focus();
			return;
		}

		if (!form.title.value) {
			alert("������ �����ּ���");
			form.title.focus();
			return;
		}

		if (!form.memo.value) {
			alert("������ �����ּ���");
			form.memo.focus();
			return;
		}
		form.submit();
	}
</script>

<%
	String id = "";
	String pass = "";

	String name = "";
	String password = "";
	String title = "";
	String memo = "";

	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	try {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		conn = ds.getConnection();
		stmt = conn.createStatement();

		String sql = "SELECT id, pw, subject, content FROM board WHERE bNo=" + idx;
		rs = stmt.executeQuery(sql);

		if (rs.next()) {

			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}

		rs.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
	<%
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		if (dto == null) {
	%>


	<div id="Nav_menu">
		<ul>
			<li><a href="login.jsp"> �α��� </a></li>
			<li><a href="join.jsp">ȸ������</a></li>
			<li>����������</li>
			<li>��ٱ���</li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="Nav_menu">
		<ul>
			<li><%=dto.getName()%> ��</li>
			<li><a href="MemberServlet?Action=LOGOUT"> �α׾ƿ� </a></li>
			<li>����������</li>
			<li>��ٱ���</li>
		</ul>
	</div>
	<%
		}
	%>
<br>

	<div id="Mainimg">
		<a href="./index.jsp"><img src="./img/main.jpg"
			style="width: 50%; height: 30%;"></img></a>
	</div>
	<div id="shopimg">
		<div style="border-bottom: 1px solid #cccccc;">
			<h3>Q&A</h3>
		</div>
		<br> <br>
	</div>
	<center>
		<table>
			<form name=modifyform method=post
				action="modify_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr style="text-align: center;">
								<td width="5" width="5" height="30" /></td>
								<td>����</td>
								<td width="5" width="5" height="30" /></td>
							</tr>
						</table>
						<table>
							<tr>
								<td>&nbsp;</td>
								<td align="center">����</td>
								<td><input type=text name=title size=48 maxlength=50
									value="<%=title%>"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">�̸�</td>
								<td><%=name%><input type=hidden name=name size=50
									maxlength=50 value="<%=name%>"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">��й�ȣ</td>
								<td><input type=password name="password" id="pass" size=48
									maxlength=50></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">����</td>
								<td><textarea name=memo cols=50 rows=13><%=memo%></textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type=button class="btn"
									style="width: 100px; height: 40px; margin-top: 10px;"
									value="����" OnClick="javascript:replyCheck();"> <input
									type=button class="btn"
									style="width: 100px; height: 40px; margin-top: 10px;"
									value="���" OnClick="javascript:history.back(-1)">
								<td>&nbsp;</td>
							</tr>
						</table>

					</td>
				</tr>
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