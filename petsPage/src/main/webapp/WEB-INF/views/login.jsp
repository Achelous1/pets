<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
  <body>
    <br>
    <div id="Nav_menu">
      <ul>
        <li><a href="./login.jsp"> �α��� </a> </li>
        <li><a href="./join.jsp"> ȸ������ </a></li>
        <li> ���������� </li>
        <li> ��ٱ��� </li>
      </ul>
    </div>

    <br>

      <div id="Mainimg">
        <a href="./index.jsp"><img src="./img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>

      <br><br><br><br><br><br>

    <center>
      <div class="loginForm">
          <form method="post" action="MemberServlet?Action=LOGIN" >
             	<div class="box">
                 <input type="text" class="iText"  name="id"  placeholder="���̵� �Է��϶��!">
                 <br>
                 <input type="password" name="password" class="iText" placeholder="��й�ȣ �Է��϶��!">
                 <p>
                     <span class="fleft"><input type="checkbox" id=""><label for=""> ���̵� ����</label></span>
                     <br>
                        <input type="submit" class="btn" style=" width: 300px; height:40px;" value="�α���">
                        <br><br>
                    <span class="fright"><a href="searchIdPw.jsp">���̵�/��й�ȣ ã��</a>&nbsp;|&nbsp;<a href="./join.jsp">ȸ������</a></span>
                 </p>
            </div>
          </form>
        </div>
    </center>
      <br><br><br><br><br><br><br><br><br><br><br><br><br>
      <legend></legend>
      <footer>
        <ul>
          <li>����</li>
        </ul>
        <ul>
          <li>��� ���۴�</li>
        </ul>
        <ul>
          <li>�����Ͻ�</li>
        </ul>

        <ul>
          <li>�������� ó����ħ</li>
        </ul>
        <ul>
          <li>���</li>
        </ul>
        <ul>
          <li>����</li>
        </ul>
      </footer>

  </body>
</html>