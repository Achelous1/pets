<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@page import="com.zip4s.pets.dao.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
	<%
		CustomerDTO customer = (CustomerDTO)session.getAttribute("customer_info");
		if (customer == null) {
	%>
	<div id="Nav_menu">
		<ul>
			<li><a href="login"> 로그인 </a></li>
			<li><a href="join">회원가입</a></li>
			<li>마이페이지</li>
			<li><a href="cart">장바구니</a></li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="Nav_menu">
		<ul>
			<li><%=customer.getCname()%> 님</li>
			<li><a href="logout"> 로그아웃 </a></li>
			<li>마이페이지</li>
			<li><a href="cart">장바구니</a></li>
		</ul>
	</div>
	<%
		}
	%>
	<br>

      <div id="Mainimg">
        <a href="/pets"><img src="resources/img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>

      <br><br>

    <center>
      <div class="dropdown" >
        <a href="shopping"><button class="dropbtn">쇼핑</button></a>
       
       <form id="itemForm" action="ProductServlet?Action=ITEM" method="post">
        <div class="dropdown-content">
	        <input type="submit" id="item" name="item" value="장난감" style="color: black; border: 0px; padding: 12px 37%; text-decoration: none;
    display: block;">
	        <input type="submit" id="item" name="item" value="간식" style="color: black; border: 0px; padding: 12px 41%; text-decoration: none;
    display: block;">
	        <input type="submit" id="item" name="item" value="의류" style="color: black; border: 0px; padding: 12px 41%; text-decoration: none;
    display: block;">
        </div>
        </form>
      </div>

      <div class="dropdown" >
        <a href="info.jsp"><button class="dropbtn">정보</button></a>
        </div>

      <div class="dropdown" >
        <a href="./event.jsp"><button class="dropbtn">이벤트</button></a>
        </div>

      <div class="dropdown" >
        <a href="./serviceBoard.jsp"><button class="dropbtn">고객센터</button></a>
      </div>
    </center>

    <br>
	<form action="ProductServlet?Action=SRH" method="post">
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="text"
				placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
	</form>

	<br><br><br><br><br><br><br><br><br><br><br><br><br>
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
      </fowoter>

  </body>
</html>
