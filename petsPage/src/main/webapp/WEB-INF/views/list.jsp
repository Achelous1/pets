<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%!Connection conn; //객체연결
	Statement stmt; //쿼리문 객체
	ResultSet rs; //레크드 객체
	DataSource ds;
	String query = "select * from board";%>

<%
	final int ROWSIZE = 5; // 한페이지에 보일 게시물 수 (페이지 당 레코드 수)
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정(페이지 당 보여줄 번호 수[1],[2],[3],[4],[5], [6],[7],[8],[9],[10])
	int pg = 1; //기본 페이지값 

	if (request.getParameter("pg") != null) { //받아온 pg값이 있을때, 다른페이지일때 
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장 
	}

	int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 해당페이지에서 시작번호(step2) 
	int end = (pg * ROWSIZE); // 해당페이지에서 끝번호(step2) 
	int allPage = 0; // 전체 페이지수 (총 레코드 수)
	int startPage = ((pg - 1) / BLOCK * BLOCK) + 1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
	int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
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
	CustomerDTO dto = (CustomerDTO) session.getAttribute("login_info");
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
			<li><%=dto.getCname()%> 님</li>
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
	<a href="index.jsp">
		<img src="./img/main.jpg" style="width: 50%; height: 30%;"></img></a>
	</div>
	<br>
	<br>
	<form action="ProductServlet" method="get">
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="text"
				placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
	</form>

	<div id="shopimg">
		<div style="border-bottom: 1px solid #cccccc;">
			<h3>Q&A</h3>
		</div>
		<br>
		<br>

		<div style="margin-left: 10%;">
			<%
				int total = 0;
				try {

					//Class.forName(driver);
					//connection = DriverManager.getConnection(url, uid, upw);

					Context context = new InitialContext();
					ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
					conn = ds.getConnection();
					stmt = conn.createStatement();

					String sqlCount = "select count(*) from board";
					rs = stmt.executeQuery(sqlCount);

					if (rs.next()) {
						total = rs.getInt(1);
					}

					int sort = 1;
					/* Ref즉 원글의 글번호를 기준으로 내림차순(DESC), Step을 기준으로 오름차순(ASC) */
					String sqlList = "select bNo, id, subject, write_date, read_cnt, lev, ref, step, step2 from board order by ref DESC, step ASC";
					rs = stmt.executeQuery(sqlList);

					while (rs.next()) {
						int stepNum = rs.getInt(1);
						String sql = "UPDATE board SET STEP2=" + sort + " where bNo=" + stepNum;
						stmt.executeUpdate(sql);
						sort++;
					}

					allPage = (int) Math.ceil(total / (double) ROWSIZE);

					if (endPage > allPage) {
						endPage = allPage;
					}

					out.print("총 게시물 : " + total + "개");

					sqlList = "SELECT bNo, id, subject, write_date, read_cnt, lev, ref, step, step2 from board where STEP2 >="
							+ start + " and STEP2 <= " + end + " order by step2 asc";
					rs = stmt.executeQuery(sqlList);
			%>
		</div>
	</div>
	<center>
		<table width="65%" cellpadding="0" cellspacing="0" border="0">
			<tr height="5">
				<td width="5"></td>
			</tr>
			<tr style="border: 1px solid #cccccc; text-align: center;">
				<td width="5"></td>
				<td width="73">번호</td>
				<td width="379">제목</td>
				<td width="73">작성자</td>
				<td width="164">작성일</td>
				<td width="58">조회수</td>
				<td width="7"></td>
			</tr>
			<%
				if (total == 0) { // total 즉, 자료가 없다면
			%>

			<tr align="center" bgcolor="#cccccc" height="30">
				<td colspan="6">등록된 글이 없습니다.</td>
			</tr>

			<%
				} else { // total이 0이 아닌 즉 자료가 1개이상 있다면 

						while (rs.next()) { // while이라는 반복문으로 자료를 찾습니다. rs.next()는 다음라인으로 이동
							int idx = rs.getInt(1); // 1은 첫번째 즉 bNo값을 idx라는 변수에 대입
							String name = rs.getString(2); //작성자-id
							String title = rs.getString(3); //제목-subject
							String time = rs.getString(4); //작성시간-write_date
							int hit = rs.getInt(5); //글조회수-read_cnt
							int indent = rs.getInt(6); //답글-lev

							/* 날짜를 비교해서 오늘 쓴 글이면 게시물 제목 끝에 new표시하기 위해 날짜 data가져오기 */
							Date date = new Date();
							SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
							String year = (String) simpleDate.format(date); /* 현재시간  가져오기*/
							String yea = time.substring(0, 10); /* 게시판 쓴일자 */

							/*   					System.out.println("=============="); 						
							 						System.out.println(year);				
													System.out.println(yea);  */
			%>

			<tr height="25" align="center">

				<td>&nbsp;</td>
				<td><%=idx%></td>
				<td align="left">
					<%
						for (int j = 0; j < indent; j++) {
					%> &nbsp;&nbsp;&nbsp;<%
 	}
 				if (indent != 0) {
 %> <img src='img/reply_icon.gif' /> <%
 	} /* 답글 이미지 추가 */
 %> <a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title%></a> <%
 	if (year.equals(yea)) {
 %> <img src='img/new.jpg' /> <!-- 새글new 이미지 추가 -->
					<%
						}
					%>
				</td>
				<td align="center"><%=name%></td>
				<td align="center"><%=time%></td>
				<td align="center"><%=hit%></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#cccccc">
				<td colspan="6"></td>
			</tr>
			<%
				}
					}
					rs.close(); //rs객체 반환
					stmt.close(); //stmt객체 반환
					conn.close(); //conn객체 반환
				} catch (SQLException e) {
					out.println(e.toString()); //에러 날경우 에러출력
				}
			%>
			<tr height="1" bgcolor="#cccccc">
				<td colspan="6" width="752"></td>
			</tr>
		</table>
		<br>
		<br>
		<div id="searchForm">
			<form action="BoardListServlet" method="get">
				<select name="opt" style="height:32.5px;">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="제목+내용">제목+내용</option>
					<option value="작성자">작성자</option>
				</select> <input type="text" size="20" style="height:31.5px; margin-top:-5px;" name="condition" />&nbsp; 
				<input type="submit" value="검색" />
			</form>
		</div>

		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">
				<%
					if (pg > BLOCK) {
				%>
				[
				<a href="list.jsp?pg=1">◀◀</a>] [
				<a href="list.jsp?pg=<%=startPage - 1%>">◀</a>]
				<%
					}
				%>

				<%
					for (int i = startPage; i <= endPage; i++) {
						if (i == pg) {
				%>
				<u><b>[<%=i%>]
				</b></u>
				<%
					} else {
				%>
				[
				<a href="list.jsp?pg=<%=i%>"><%=i%></a>]
				<%
					}
					}
				%>

				<%
					if (endPage < allPage) {
				%>
				[
				<a href="list.jsp?pg=<%=endPage + 1%>">▶</a>] [
				<a href="list.jsp?pg=<%=allPage%>">▶▶</a>]
				<%
					}
				%>
				</td>
			</tr>
			<br>
			<br>
			<tr align="center">
				<td><input type="submit" class="btn"
					style="width: 300px; height: 40px;" value="글쓰기"
					OnClick="window.location='write.jsp'"></td>
				<!-- 글쓰기 누르면 write.jsp로 이동 -->
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