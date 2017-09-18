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


<%!Connection conn;
	Statement stmt;
	ResultSet rs;
	DataSource ds;
	String query = "select * from board";%>

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
<br>
	<%
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		if (dto == null) {
	%>


	<div id="Nav_menu">
		<ul>
			<li><a href="login.jsp"> 로그인 </a></li>
			<li><a href="join.jsp">회원가입</a></li>
			<li>마이페이지</li>
			<li>장바구니</li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="Nav_menu">
		<ul>
			<li><%=dto.getName()%> 님</li>
			<li><a href="MemberServlet?Action=LOGOUT"> 로그아웃 </a></li>
			<li>마이페이지</li>
			<li>장바구니</li>
		</ul>
	</div>
	<%
		}
	%>
<br>

	<div id="Mainimg">
		 <a href="./index.jsp"><img src="./img/main.jpg" style="width: 50%; height: 30%;"></img></a>
	</div>

	<div id="shopimg">
		<div style="border-bottom: 1px solid #cccccc;">
			<h3>Q&A</h3>
		</div>
		<br>
		<br>
	</div>
	
		<%
			int idx = Integer.parseInt(request.getParameter("idx"));
			int pg = Integer.parseInt(request.getParameter("pg"));

			try {

				Context context = new InitialContext();
				ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

				conn = ds.getConnection();
				stmt = conn.createStatement();

				String sql = "SELECT id, SUBJECT, content, write_date, read_cnt FROM board WHERE bNo=" + idx;
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					String name = rs.getString(1);
					String title = rs.getString(2);
					String memo = rs.getString(3);
					String time = rs.getString(4);
					int hit = rs.getInt(5);
					hit++;
		%>
		<center>
			<table>
				<tr>
					<td>

						<table width="413">

							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">글번호</td>
								<td width="319"><%=idx%></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>
							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">제목</td>
								<td width="319"><%=title%></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>
							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">이름</td>
								<td width="319"><%=name%></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>
							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">작성일</td>
								<td width="319"><%=time%></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>

							<tr>
								<td width="0">&nbsp;</td>
								<td align="center" width="76">조회수</td>
								<td width="319"><%=hit%></td>
								<td width="0">&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>
							<tr>
								<td width="0"></td>
								<td width="399" colspan="2" height="200"><%=memo%>
							</tr>

							<%
								sql = "UPDATE board SET read_cnt=" + hit + " where bNo=" + idx;
										stmt.executeUpdate(sql);
										rs.close();
										stmt.close();
										conn.close();
									}
								} catch (SQLException e) {
								}
							%>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4" width="407"></td>
							</tr>
							<tr height="1" bgcolor="#cccccc">
								<td colspan="4" width="407"></td>
							</tr>
							<tr align="center" >
								<td width="0">&nbsp;</td>
								<td colspan="2" width="399" height="50px">
								<input type=button class="btn" value="글쓰기" OnClick="window.location='write.jsp'">
								<input type=button class="btn" value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>&pg=<%=pg%>'">
								<input type=button class="btn" value="목록" OnClick="window.location='list.jsp?pg=<%=pg%>'"> 
								<input type=button class="btn" value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
								<input type=button class="btn" value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
								<td width="0">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
		<br><br><br><br><br><br><br><br>
		<legend></legend>
		<footer>
		<ul>
			<li>광고</li>
		</ul>
		<ul>
			<li>경숙 컴퍼니</li>
		</ul>
		<ul>
			<li>비지니스</li>
		</ul>

		<ul>
			<li>개인정보 처리방침</li>
		</ul>
		<ul>
			<li>약관</li>
		</ul>
		<ul>
			<li>설정</li>
		</ul>
		</footer>
</body>
</html>