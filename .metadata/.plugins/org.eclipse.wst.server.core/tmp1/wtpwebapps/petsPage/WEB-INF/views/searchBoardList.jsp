<%@page import="com.zip4s.pets.dto.BoardDTO"%>
<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>


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
		<a href="index.jsp"> <img src="./img/main.jpg"
			style="width: 50%; height: 30%;"></img></a>
	</div>
	<br>
	<br>
	<form action="ProductServlet?Action=SRH" method="post">
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="text"
				placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
	</form>
	<!-------------------------------------------  -->

	<div id="shopimg">
		<div style="border-bottom: 1px solid #cccccc;">
			<h3>Q&A</h3>
		</div>
		<br> <br>
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
				ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("search_board");
				if (list == null) {
			%>
			<h2>일치하는 결과가 없습니다.</h2>
			<%
				}

				for (int i = 0; i < list.size(); i++) {
					BoardDTO bdto = list.get(i);
					int idx = bdto.getBno();
					int indent = bdto.getLev();
					String title = bdto.getSubject();
					String name = bdto.getId();
					int hit = bdto.getRead_cnt();
					String time = String.valueOf(bdto.getWrite_date());

					/* 날짜를 비교해서 오늘 쓴 글이면 게시물 제목 끝에 new표시하기 위해 날짜 data가져오기 */
					Date date = new Date();
					SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
					String year = (String) simpleDate.format(date); /* 현재시간  가져오기*/
					String yea = time.substring(0, 10); /* 게시판 쓴일자 */
			%>
			<%-- <tr>
			<td width="5"></td>
			<td><%=dto.getBno()%></td>
			<td><%=dto.getSubject() %></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getWrite_date()%></td>
			<td><%=dto.getRead_cnt()%></td>
			
		</tr> --%>
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
 %> <a href="view.jsp?idx=<%=idx%>&pg=<%=1%>"><%=title%></a> <%
 	if (year.equals(yea)) {
 %> <img src='img/new.jpg' /> <!-- 새글new 이미지 추가 --> <%
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
			%>


			<tr height="1" bgcolor="#cccccc">
				<td colspan="6" width="752"></td>
			</tr>
		</table>
		<br> <br>
		<div id="searchForm">
			<form action="BoardListServlet" method="get">
				<select name="opt" style="height: 32.5px;">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="제목+내용">제목+내용</option>
					<option value="작성자">작성자</option>
				</select> <input type="text" size="20"
					style="height: 31.5px; margin-top: -5px;" name="condition" />&nbsp;
				<input type="submit" value="검색" />
			</form>
		</div>

<br>

			<div>
				<input type="submit" class="btn"
					style="width: 300px; height: 40px;" value="글쓰기"
					OnClick="window.location='write.jsp'">
				<!-- 글쓰기 누르면 write.jsp로 이동 -->
			</div>
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