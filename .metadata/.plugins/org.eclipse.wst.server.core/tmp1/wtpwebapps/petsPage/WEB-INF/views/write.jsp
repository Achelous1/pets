<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script language = "javascript">  // 자바 스크립트 시작
<%@ page import="java.sql.*"%>	//자바스크립트를 이용한 유효성검사( 이름, 비밀번호, 제목, 내용을 입력 안했을시에 경고창을 띄우고 입력하게끔 함)

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
         <a href="./index.jsp"><img src="./img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>
      
      
      <form name="writeform" method="post" action="write_ok.jsp">	<!-- 이 곳에 쓰인 값들을 write_ok.jsp에 보내기 -->
      <tr>
   		<td>
   		<div id="shopimg">
   		<div style="border-bottom:1px solid #cccccc;"><h3> 글쓰기 </h3></div>
   		</div>
   		<br><br><br>
   		<center>
    	<table>
    	 <tr>
	      	<td>&nbsp;</td>
	      	<td align="center">제목</td>
	      	<td><input name="title" size="48" maxlength="100"></td>
	      	<td>&nbsp;</td>
	      	</tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
    <tr>
    
    <%if(dto==null){ %>
	      <td>&nbsp;</td>
	      <td align="center">이름</td>
	      <td><input name="name" size="48" maxlength="50"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">비밀번호</td>
	      <td><input type="password" name="password" size="48" maxlength="50"></td>
	      <td>&nbsp;</td>
      <%}else{ %>
	      <td>&nbsp;</td>
	      <td align="center">이름</td>
	      <td><input name="name" size="48" maxlength="50" value="<%=dto.getName() %>"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">비밀번호</td>
	      <td><input type="password" name="password" size="48" maxlength="50" value="<%=dto.getPw()%>"></td>
	      <td>&nbsp;</td>
      <%} %>
     </tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      <input type="submit" class="btn" style=" width: 100px; height:40px; margin-top: 10px;" value="등록" OnClick="javascript:writeCheck();">       
      <!-- 등록 버튼을 누를시 writeCheck() 함수로 가서 검사를 하고 이상이 없을시 form.submit()으로 write_ok.jsp로 값을 보내게 됨 -->
       <input type="button" class="btn" style=" width: 100px; height:40px; margin-top: 10px;" value="취소" OnClick="javascript:history.back(-1)"/>
       
      
       <!-- 취소 버튼을 누를시 뒤로가기 코드인 history.back()을 넣음 -->
       </td>
      <td>&nbsp;</td>
     </tr>
    </table>
    </center>
   </td>
   </div>
  </tr>
  </form>
 </table>
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