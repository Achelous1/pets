<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
    <div id="Nav_menu">
      <ul>
        <li><a href="login"> 로그인 </a> </li>
        <li><a href="join"> 회원가입 </a></li>
        <li> 마이페이지 </li>
        <li> 장바구니 </li>
      </ul>
    </div>
    <br>
      <div id="Mainimg">
        <a href="/pets"><img src="resources/img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>
      <br><br><br><br><br><br>
    <center>
      <div class="loginForm">
          <form method="post" action="loginChk" >
             	<div class="box">
                 <input type="text" class="iText"  name="id"  placeholder="아이디 입력하라멍!">
                 <br>
                 <input type="password" name="pw" class="iText" placeholder="비밀번호 입력하라냥!">
                 <p>
                     <span class="fleft"><input type="checkbox" id=""><label for=""> 아이디 저장</label></span>
                     <br>
                        <input type="submit" class="btn" style=" width: 300px; height:40px;" value="로그인">
                        <br><br>
                    <span class="fright"><a href="searchIdPw.jsp">아이디/비밀번호 찾기</a>&nbsp;|&nbsp;<a href="join">회원가입</a></span>
                 </p>
            </div>
          </form>
        </div>
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
