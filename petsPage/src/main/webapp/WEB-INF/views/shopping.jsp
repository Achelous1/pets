<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<<<<<<< HEAD
    <link rel="stylesheet" href="./css/style.css">
=======
    <link rel="stylesheet" href="resources/css/style.css">
>>>>>>> jin-dev
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Pet's</title>
  </head>
  <body>
    <br>
	<%
	CustomerDTO dto = (CustomerDTO) session.getAttribute("login_info");
		if (dto == null) {
	%>
<<<<<<< HEAD


	<div id="Nav_menu">
		<ul>
			<li><a href="login.jsp"> 로그인 </a></li>
			<li><a href="join.jsp">회원가입</a></li>
=======
	<div id="Nav_menu">
		<ul>
			<li><a href="login"> 로그인 </a></li>
			<li><a href="join">회원가입</a></li>
>>>>>>> jin-dev
			<li>마이페이지</li>
			<li>장바구니</li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="Nav_menu">
		<ul>
<<<<<<< HEAD
			<li><%=dto.getName()%> 님</li>
			<li><a href="MemberServlet?Action=LOGOUT"> 로그아웃 </a></li>
=======
			<li><%=dto.getCname()%> 님</li>
			<li><a href="logout"> 로그아웃 </a></li>
>>>>>>> jin-dev
			<li>마이페이지</li>
			<li>장바구니</li>
		</ul>
	</div>
	<%
		}
	%>
<<<<<<< HEAD

    <br>

      <div id="Mainimg">
        <a href="./index.jsp"><img src="./img/main.jpg" style="width:50%;height:30%;"></img></a>
=======
    <br>
      <div id="Mainimg">
        <a href="/pets"><img src="resources/img/main.jpg" style="width:50%;height:30%;"></img></a>
>>>>>>> jin-dev
      </div>

      <br><br>

    <center>
      <div class="dropdown" >
<<<<<<< HEAD
        <a href="./shopping.jsp"><button class="dropbtn">쇼핑</button></a>
=======
        <a href="resources/shopping.jsp"><button class="dropbtn">쇼핑</button></a>
>>>>>>> jin-dev
       
       <form id="itemForm" action="ProductServlet?Action=ITEM" method="post">
        <div class="dropdown-content">
	        <input type="submit" id="item" name="item" value="장난감" style="color: black; border: 0px; padding: 12px 36%; text-decoration: none;
    display: block;">
	        <input type="submit" id="item" name="item" value="간식" style="color: black; border: 0px; padding: 12px 40%; text-decoration: none;
    display: block;">
	        <input type="submit" id="item" name="item" value="의류" style="color: black; border: 0px; padding: 12px 40%; text-decoration: none;
    display: block;">
        </div>
        </form>
      </div>

      <div class="dropdown" >
        <button class="dropbtn">정보</button>
        </div>
      </div>

      <div class="dropdown" >
        <a href="./event.jsp"><button class="dropbtn">이벤트</button></a>
        </div>
      </div>

      <div class="dropdown" >
        <a href="./serviceBoard.jsp"><button class="dropbtn">고객센터</button></a>
        </div>
      </div>
    </center>

    <br>

<<<<<<< HEAD
<form action="ProductServlet?Action=SRH" method="post">
=======
	<form action="ProductServlet?Action=SRH" method="post">
>>>>>>> jin-dev
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="text"
				placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
<<<<<<< HEAD
	<br><br><br>

      <div id="shopimg">
      <div style="border-bottom:1px solid #cccccc;"><h3> 장난감 </h3></div> <br>
      <center>
        <span><img src="./img/toy-1.jpg" style="width:20%; height:20%;"></span>
        <span><a href="./toyinfo.jsp"><img src="./img/toy-2.jpg" style="width:20%; height:20%;"></a></span>
        <span><img src="./img/toy-3.jpg" style="width:20%; height:20%;"></span>
        <span><img src="./img/toy-4.jpg" style="width:20%; height:20%;"></span>
=======
	</form>
	<br><br><br>
    <div id="shopimg">
      <div style="border-bottom:1px solid #cccccc;"><h3> 장난감 </h3></div> <br>
      <center>
        <span><img src="resources/img/toy-1.jpg" style="width:20%; height:20%;"></span>
        <span><a href="toyinfo"><img src="resources/img/toy-2.jpg" style="width:20%; height:20%;"></a></span>
        <span><img src="resources/img/toy-3.jpg" style="width:20%; height:20%;"></span>
        <span><img src="resources/img/toy-4.jpg" style="width:20%; height:20%;"></span>
>>>>>>> jin-dev
        <div>
          <span>찍찍낚시</span>
          <span style="margin-left:17%; margin-right:5%;">카샤카샤</span>
          <span style="margin-left:10%; margin-right:18%;">문어냠얌</span>
          <span>꽁치꽁치</span>
        </div>
        <div>
          <span>5,500원</span>
          <span style="margin-left:18%; margin-right:6%;">8,500원</span>
          <span style="margin-left:10%; margin-right:18%;">7,500원</span>
          <span>7,500원</span>
        </div>
      </div>
    </center>
    <br><br><br><br>

    <div id="shopimg">
    <div style="border-bottom:1px solid #cccccc;"><h3> 애완동물 옷 </h3></div> <br>
    <center>
<<<<<<< HEAD
      <span><img src="./img/clothes-1.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="./img/clothes-2.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="./img/clothes-3.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="./img/clothes-4.jpg" style="width:20%; height:20%; margin:1%;"></span>
=======
      <span><img src="resources/img/clothes-1.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="resources/img/clothes-2.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="resources/img/clothes-3.jpg" style="width:20%; height:20%; margin:1%;"></span>
      <span><img src="resources/img/clothes-4.jpg" style="width:20%; height:20%; margin:1%;"></span>
>>>>>>> jin-dev
      <div>
        <span>하와이원</span>
        <span style="margin-left:18%; margin-right:6%;">하와이투</span>
        <span style="margin-left:10%; margin-right:20%;">스프라잇</span>
        <span>스프라잍</span>
      </div>
      <div>
        <span>7,500원</span>
        <span style="margin-left:19%; margin-right:7%;">4,500원</span>
        <span style="margin-left:9%; margin-right:21%;">4,500원</span>
        <span>4,500원</span>
      </div>
    </div>
  </center>

  <br><br><br><br>

  <div id="shopimg">
  <div style="border-bottom:1px solid #cccccc;"><h3> 간식 </h3></div> <br>
  <center>
<<<<<<< HEAD
    <span><img src="./img/food-1.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="./img/food-2.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="./img/food-3.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="./img/food-4.jpg" style="width:20%; height:20%; margin:1%;"></span>
=======
    <span><img src="resources/img/food-1.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="resources/img/food-2.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="resources/img/food-3.jpg" style="width:20%; height:20%; margin:1%;"></span>
    <span><img src="resources/img/food-4.jpg" style="width:20%; height:20%; margin:1%;"></span>
>>>>>>> jin-dev
    <div>
      <span>시원우유</span>
      <span style="margin-left:18%; margin-right:6%;">츄로스으</span>
      <span style="margin-left:10%; margin-right:20%;">치킨바나</span>
      <span>한우치킨</span>
    </div>
    <div>
      <span>2,500원</span>
      <span style="margin-left:19%; margin-right:7%;">2,500원</span>
      <span style="margin-left:9%; margin-right:21%;">2,800원</span>
      <span>2,800원</span>
    </div>
  </div>
</center>
<<<<<<< HEAD

=======
>>>>>>> jin-dev
      <br><br><br><br><br><br><br><br><br><br>
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
