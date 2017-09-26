<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zip4s.pets.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<!-- 장난감 제품 -->
      <div id="shopimg" class="row" style="align-content:center;">
        <div style="border-bottom:1px solid #cccccc; margin-bottom:20px;">
      	  <h3> 장난감 </h3>
        </div>
        <div style="text-align:center;">
	        <c:forEach var="items" varStatus="status" items="${product_list}">
	        	<c:if test="${ items.item == 'toy' }">
				<div class="col-sm-3">
				<a href="iteminfo?pno=${ items.pno }"><img src="${ items.pimg }" alt="${ items.pname }" style="width:100%; height:auto;"></a>
			    <div>
			          <span>${ items.pname }</span>
			          <p>${ items.price }원</p>
			        </div>
		        </div>
		        </c:if>
			</c:forEach>
        </div>
      </div>
    <br><br><br><br>
    
    <!-- 애완동물 옷 제품 -->
      <div id="shopimg" class="row" style="align-content:center;">
        <div style="border-bottom:1px solid #cccccc; margin-bottom:20px;">
      	  <h3> 애완동물 옷 </h3>
        </div>
        <div style="text-align:center;">
	        <c:forEach var="items" varStatus="status" items="${product_list}">
	        	<c:if test="${ items.item == 'clothes' }">
				<div class="col-sm-3">
					<a href="iteminfo?pno=${ items.pno }"><img src="${ items.pimg }" alt="${ items.pname }" style="width:100%; height:auto;"></a>
			    	<div>
			          <span>${ items.pname }</span>
			          <p>${ items.price }원</p>
			        </div>
		        </div>
		        </c:if>
			</c:forEach>
        </div>
      </div>
    <br><br><br><br>

	<!-- 간식 제품 -->
      <div id="shopimg" class="row" style="align-content:center;">
        <div style="border-bottom:1px solid #cccccc; margin-bottom:20px;">
      	  <h3> 간식 </h3>
        </div>
        <div style="text-align:center;">
	        <c:forEach var="items" varStatus="status" items="${product_list}">
	        	<c:if test="${ items.item == 'snack' }">
				<div class="col-sm-3">
				<a href="iteminfo?pno=${ items.pno }"><img src="${ items.pimg }" alt="${ items.pname }" style="width:100%; height:auto;"></a>
			    <div>
			          <span>${ items.pname }</span>
			          <p>${ items.price }원</p>
			        </div>
		        </div>
		        </c:if>
			</c:forEach>
        </div>
      </div>
      <br><br><br><br><br><br><br><br><br><br>
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
