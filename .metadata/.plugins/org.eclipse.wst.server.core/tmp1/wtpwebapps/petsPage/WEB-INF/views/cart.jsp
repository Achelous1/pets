<%@page import="com.zip4s.pets.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function numcheck(val, jaego) {
		if (val > jaego - 1) {
			alert("재고량이 없습니다")
			document.frm.ea.value = jaego
		} else if (val < 2) {
			document.frm.ea.value = 1
		}
	}
	function up(val, jaego) {
		if (val > jaego - 1) {
			alert("재고량이 없습니다")
			document.frm.ea.value = jaego
		} else {
			document.frm.ea.value = (val / 1) + 1
		}
	}

	function down(val) {
		if (val < 2) {
			document.frm.ea.value = 1
		} else {
			document.frm.ea.value = val - 1
		}
	}
</script>
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
	<br>
	<br>

	<h1 style="margin-left: 10%;">장바구니</h1>

	<%
		ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)session.getAttribute("list_cart");
		for (int i = 0; i < list.size(); i++) {
			ProductDTO pdto = list.get(i);
			
			String img = pdto.getPimg();
			String pname = pdto.getName();
			int price = pdto.getPrice();
			int qty = pdto.getQty();
	%>

	<hr style="border: 1px solid #E1E1E1;">
	<div>
		<img src="<%=img %>" width="15%" style="margin-left: 8%;"></img>
		<div
			style="padding: 2%; float: right; margin-right: 20%; margin-top: 3%;">
			<h4>삭제</h4>
		</div>
		<div
			style="padding: 2%; float: right; margin-right: 3%; margin-top: 3%;">
			<h4>금액합계</h4>
		</div>
		<div
			style="padding: 2%; float: right; margin-right: 3%; margin-top: 3%;">
			<table>
				<form name="frm">
					<tbody>
						<tr>
							<td><input type="text" name="ea" class="form" size="2"
								value="<%=qty %>" maxlength="2" onblur="numcheck(this.form.ea.value,10)"
								onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">
							</td>
							<td valign="middle" height="30"><input type="button"
								value="▲" onclick="up(this.form.ea.value,10)"
								style="background-color: white; border: 0; height: 14px; font-size: 12px"
								name="plus"> <br> <input type="button" value="▼"
								onclick="down(this.form.ea.value)"
								style="background-color: white; border: 0; height: 14px; font-size: 12px"
								name="minus"></td>
						</tr>
					</tbody>
				</form>
			</table>
		</div>
		<div
			style="padding: 2%; float: right; margin-right: 3%; margin-top: 3%;">
			<h4><%=price %>원</h4>
		</div>
		<div
			style="padding: 2%; float: right; margin-right: 3%; margin-top: 3%;">
			<h4><%=pname %></h4>
		</div>

			<% 
		}
	%>
	
	<hr>
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
