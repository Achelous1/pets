<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<%! Connection conn;
	Statement stmt;
	ResultSet rs;
	DataSource ds;
	String query = "select * from board";%>
<%
	request.setCharacterEncoding("euc-kr");	/* 파라미터값을 한글로 받아옴 */
	String password=null;
	int idx = Integer.parseInt(request.getParameter("idx")); //DB에 저장된 bNo 받아오기
	int pg = Integer.parseInt(request.getParameter("pg"));
	String passw = request.getParameter("password"); //delete때 입력한 비번 받아오기

	
 	try {

		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		conn = ds.getConnection();
		stmt = conn.createStatement();

		String sql = "SELECT pw FROM board WHERE bNo=" + idx;	/* SELECT문을 이용해서 데이터베이스에 있는 bNo 비밀번호를 가져와서 저장 */
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			password = rs.getString(1);
		} 
		if (password.equals(passw)) {		 
			sql = "DELETE FROM board WHERE bNo=" + idx;
			stmt.executeUpdate(sql);
			%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="list.jsp?pg=<%=pg%>";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		}
 	} catch (SQLException e) {
		out.println(e.toString());
	}
%>		