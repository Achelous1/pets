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

<%! Connection conn;
	Statement stmt;
	ResultSet rs;
	DataSource ds;
	String query = "select * from board";%>
<%
	request.setCharacterEncoding("euc-kr");	/* �Ķ���Ͱ��� �ѱ۷� �޾ƿ� */
	String password=null;
	int idx = Integer.parseInt(request.getParameter("idx")); //DB�� ����� bNo �޾ƿ���
	int pg = Integer.parseInt(request.getParameter("pg"));
	String passw = request.getParameter("password"); //delete�� �Է��� ��� �޾ƿ���

	
 	try {

		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		conn = ds.getConnection();
		stmt = conn.createStatement();

		String sql = "SELECT pw FROM board WHERE bNo=" + idx;	/* SELECT���� �̿��ؼ� �����ͺ��̽��� �ִ� bNo ��й�ȣ�� �����ͼ� ���� */
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			password = rs.getString(1);
		} 
		if (password.equals(passw)) {		 
			sql = "DELETE FROM board WHERE bNo=" + idx;
			stmt.executeUpdate(sql);
			%>
  			<script language=javascript>
   				self.window.alert("�ش� ���� �����Ͽ����ϴ�.");
   				location.href="list.jsp?pg=<%=pg%>";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				location.href="javascript:history.back()";
			</script>
<%		
		}
 	} catch (SQLException e) {
		out.println(e.toString());
	}
%>		