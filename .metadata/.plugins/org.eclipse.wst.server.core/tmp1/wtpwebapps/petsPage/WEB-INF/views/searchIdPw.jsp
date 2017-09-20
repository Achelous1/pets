<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Pet's</title>
  </head>
  <script type="text/javascript">
  function findId(name){
	   var name = name;
	   
	   console.log(name);
	   window.open("MemberServlet?Action=sId&name="+name, "Check_availability", "width=500,height=200");
	}
  
  function findPw(name, id){
	  var name = name;
	  var id = id;
	   
	   console.log(name);
	   console.log(id);
	   window.open("MemberServlet?Action=sPw&name=" + name+"&id="+id, "Check_availability", "width=500,height=300");
  }
  </script>
  <body>
    <br>
    <div id="Nav_menu">
      <ul>
        <li><a href="./login.jsp"> 로그인 </a> </li>
        <li><a href="./join.jsp"> 회원가입 </a></li>
        <li> 마이페이지 </li>
        <li> 장바구니 </li>
      </ul>
    </div>

    <br>

      <div id="Mainimg">
        <a href="./index.jsp"><img src="./img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>

      <br><br><br><br>

    <center>
			<form method="post" id="findIdForm" action="MemberServlet?Action=sId" onsubmit="return false;">
				<div class="box">
				<span style="text-align:left;">아이디 찾기</span>
				<hr width="50%">
					<input type="text" class="iText" name="name" id="name" placeholder="이름 입력하라멍!">
					<input type="button" class="btn" style="width: 100px; height: 30px;" value="확인" onclick="findId(document.getElementById('name').value)">
				</div>
			</form>
			
			<br><br><br><br>
			<form method="post" id="findPwForm" action="MemberServlet?Action=sPw"  onsubmit="return false;">
				<div class="box">
				<span width="50%">비밀번호 찾기</span>
				<hr style="width:50%; boarder:1px solid #ffffff;">
					<input type="text" class="iText" name="name" id="pname" placeholder="이름 입력하라멍!">
					<input type="text" class="iText" name="id" id="pid" placeholder="아이디 입력하라멍!">
					<input type="button" class="btn" style="width: 100px; height: 30px;" value="확인" onclick="findPw(document.getElementById('pname').value,document.getElementById('pid').value)">
				</div>
			</form>
    </center>
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
      </footer>

  </body>
</html>
