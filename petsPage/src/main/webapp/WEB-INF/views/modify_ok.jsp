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

<%
	/* 	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:board2"; */
	String id = "";
	String pass = "";
	String password = "";

	try {

		request.setCharacterEncoding("euc-kr");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		String passw = request.getParameter("password");

		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		conn = ds.getConnection();
		stmt = conn.createStatement();
		
		String sql = "SELECT pw FROM board WHERE bNo=" + idx;
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {
			sql = "UPDATE board SET subject='" + title + "' ,content='" + memo + "' WHERE bNo=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="view.jsp?idx=<%=idx%>&pg=<%=pg%>";
</script>
<%
	rs.close();
			stmt.close();
			conn.close();

		} else {
%>
<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>
<%
	}

	} catch (SQLException e) {
		out.println(e.toString());
	}
%>