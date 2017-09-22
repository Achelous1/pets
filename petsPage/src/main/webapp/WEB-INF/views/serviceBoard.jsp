<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Pet's</title>
  </head>
  <body>
	<br>
	<%
		CustomerDTO dto = (CustomerDTO)session.getAttribute("login_info");
		if (dto == null) {
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
			<li><%=dto.getCname()%> 님</li>
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
        <button class="dropbtn dropdown-toggle" data-toggle="dropdown">쇼핑 <span class="caret"></span></button>
     	<ul class="dropdown-menu">
     	  <li><a href="shopping">전체상품 보기</a></li>
     	  <li class="divider"></li>
		  <li><a href="shopping?item=toy">장난감</a></li>
		  <li><a href="shopping?item=clothes">옷</a></li>
		  <li><a href="shopping?item=snack">간식</a></li>
		</ul>
      </div>

      <div class="dropdown" >
        <a href="info"><button class="dropbtn">정보</button></a>
        </div>

      <div class="dropdown" >
        <a href="event"><button class="dropbtn">이벤트</button></a>
        </div>

      <div class="dropdown" >
        <a href="serviceBoard"><button class="dropbtn">고객센터</button></a>
      </div>
    </center>

    <br>
	<form action="search" method="get">
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="searchStr" placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
	</form>
      <br><br><br>

      <div id="shopimg">
      <div style="border-bottom:1px solid #cccccc;"><h3>고객센터</h3></div>
      <br><br>
      <center>
        <span><a href="list"><img src="resources/img/QA2.jpg" style="width:30%; height:30%;"></a>
        <img src="resources/img/QA.jpg" style="width:30%; height:30%;"></span>
      <br><br><br><br><br><br>
      <span><img src="resources/img/후기.jpg" style="width:30%; height:30%;"><img src="resources/img/후기2.jpg" style="width:30%; height:30%;"></span>
      </center>

      <br><br><br><br><br><br><br><br><br>
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
