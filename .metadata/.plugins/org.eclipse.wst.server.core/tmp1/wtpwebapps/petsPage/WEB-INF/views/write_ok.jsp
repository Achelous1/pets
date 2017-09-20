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
<%@ page import="java.util.*, java.text.*"  %>
<%-- <%!
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
 String today = formatter.format(new java.util.Date());

%> --%>
    <%!Connection conn;
	Statement stmt;
	ResultSet rs;
	DataSource ds;
	String query = "select * from board";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Pet's</title>
</head>	

<body>

<select id="nextArticleSeq" resultType="_int">
board_seq.currval from dual
</select>

<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

	/* Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	
	String url = "jdbc:odbc:board2";
	String id = "";
	String pass = ""; */
	
	String name = request.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
	String password = request.getParameter("password");//write.jsp에서 password에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String today = request.getParameter("sysdate");
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
	
/* 	String sql = "INSERT INTO board(bNo,id,pw,subject,write_date,content,ref) VALUES(board_seq.nextval,?,?,?,sysdate,?,?)";  */
	%>
	
	
	<%
	int max = 0;
	int lev = 0;
 	int step = 0;
 	int step2 = 0;
	
	try {	
		 
		 Context context = new InitialContext();
         ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
         conn= ds.getConnection();
         stmt = conn.createStatement();

         String sql = "SELECT MAX(bNo) FROM board"; 
         ResultSet rs = stmt.executeQuery(sql);

         if(rs.next()){ 
        	 max=rs.getInt(1); 
        	 }      
     	sql = "INSERT INTO board(bNo,id,pw,subject,write_date,content,REF,lev,step,step2) VALUES(board_seq.nextval,?,?,?,sysdate,?,?,?,?,?)"; 		
        PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
/* 		pstmt.setString(5, today); */
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
 		pstmt.setInt(6, lev);
 		pstmt.setInt(7, step);
 		pstmt.setInt(8, step2); 
 		
		/* step2를 +1씩 증가시키는 update를 시키는 함수*/
		sql = "SELECT max(bno) FROM board";
		rs = stmt.executeQuery(sql);
/* 		System.out.println(max); */
		
		while(rs.next()){
/* 		System.out.println("1");  */
		sql = "UPDATE board SET STEP2=STEP2+1";
		stmt.executeUpdate(sql);
	 	step2++;
	} 
	

		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 
%>

   <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
   </script>

</body>
</html>