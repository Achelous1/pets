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
<%
 	request.setCharacterEncoding("euc-kr");
/* 	String id = "";
	String pass = ""; */
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
 	String today = request.getParameter("sysdate");
	String memo = request.getParameter("memo"); 
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
/* 	System.out.println(pg); */
	try {
		
		int ref = 0;
		int indent = 0;
		int step = 0;
		int step2 = 0;
		
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		conn = ds.getConnection();
		stmt = conn.createStatement();

/* 		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String title = request.getParameter("title");
		String today = request.getParameter("sysdate");
		String memo = request.getParameter("memo"); */
		
		
		/* select���� �̿��ؼ� idx �� ������ ref, indent, step���� ������ */
		String sql = "SELECT ref, lev, step, step2 FROM board WHERE bNo="+idx;
/* 		System.out.println(ref);
		System.out.println(indent);
		System.out.println(step);
		System.out.println(step2);
		System.out.println(idx); */
		
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
			step2 = rs.getInt(4);
		}
		/* ref���� �ҷ��� ref�� ���� step�� �ҷ��� step������ ū �ڷ���� step�� +1 ��Ű�� �� */
		sql = "UPDATE board SET STEP=STEP+1, step2=step2+1, lev=lev+1 where ref=" +ref+ "and STEP>" +step;
		stmt.executeUpdate(sql);
		
		/* reply.jsp���� ������ ����� select���� �̿��� ������ �־� �ֵ� ref�� ���� ���� �ְ� indent�� step�� ������ ������ +1 ���Ѽ� �ְ� �� */
		sql = "INSERT INTO board(bno, id, pw, subject, content, ref, lev, step, step2, write_date) values(board_no.nextval,?,?,?,?,?,?,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step + 1);
		pstmt.setInt(8, step2 + 1);

		/* step2�� +1�� ������Ű�� update�� ��Ű�� �Լ�*/
 			sql = "SELECT max(bno) FROM board";
			rs = stmt.executeQuery(sql);
			System.out.println(rs); 
			
			while(rs.next()){
			System.out.println("2"); 
			sql = "UPDATE board SET STEP2=STEP2+1";
			stmt.executeUpdate(sql);
		 	step2++;
		} 
		

		pstmt.execute();
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();

	} catch (Exception e) {
	  e.printStackTrace();
	} 
%>

<script language=javascript>
	self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
	location.href="list.jsp?pg=<%=pg%>";
</script>