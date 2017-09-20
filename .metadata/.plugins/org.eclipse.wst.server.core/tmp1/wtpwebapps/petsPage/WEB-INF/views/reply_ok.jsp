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
		
		
		/* select문을 이용해서 idx 즉 원글의 ref, indent, step값을 가져옴 */
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
		/* ref값이 불러온 ref와 같고 step이 불러온 step값보다 큰 자료들의 step을 +1 시키게 됨 */
		sql = "UPDATE board SET STEP=STEP+1, step2=step2+1, lev=lev+1 where ref=" +ref+ "and STEP>" +step;
		stmt.executeUpdate(sql);
		
		/* reply.jsp에서 가져온 값들과 select문을 이용한 값들을 넣어 주되 ref는 같은 값을 넣고 indent와 step은 원글의 값보다 +1 시켜서 넣게 됨 */
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

		/* step2를 +1씩 증가시키는 update를 시키는 함수*/
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
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp?pg=<%=pg%>";
</script>