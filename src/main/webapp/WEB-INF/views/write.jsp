<%@page import="com.pets.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<script language = "javascript">  // �ڹ� ��ũ��Ʈ ����
<%@ page import="java.sql.*"%>	//�ڹٽ�ũ��Ʈ�� �̿��� ��ȿ���˻�( �̸�, ��й�ȣ, ����, ������ �Է� �������ÿ� ���â�� ���� �Է��ϰԲ� ��)

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form �� �ִ� name ���� ���� ��
   {
    alert( "�̸��� �����ּ���" ); // ���â ���
    form.name.focus();   // form �� �ִ� name ��ġ�� �̵�
    return;
   }
   
   if( !form.password.value )
   {
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "������ �����ּ���" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "������ �����ּ���" );
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
		MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
		if (dto == null) {
	%>


	<div id="Nav_menu">
		<ul>
			<li><a href="login.jsp"> �α��� </a></li>
			<li><a href="join.jsp">ȸ������</a></li>
			<li>����������</li>
			<li>��ٱ���</li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="Nav_menu">
		<ul>
			<li><%=dto.getName()%> ��</li>
			<li><a href="MemberServlet?Action=LOGOUT"> �α׾ƿ� </a></li>
			<li>����������</li>
			<li>��ٱ���</li>
		</ul>
	</div>
	<%
		}
	%>
<br>

      <div id="Mainimg">
         <a href="./index.jsp"><img src="./img/main.jpg" style="width:50%;height:30%;"></img></a>
      </div>
      
      
      <form name="writeform" method="post" action="write_ok.jsp">	<!-- �� ���� ���� ������ write_ok.jsp�� ������ -->
      <tr>
   		<td>
   		<div id="shopimg">
   		<div style="border-bottom:1px solid #cccccc;"><h3> �۾��� </h3></div>
   		</div>
   		<br><br><br>
   		<center>
    	<table>
    	 <tr>
	      	<td>&nbsp;</td>
	      	<td align="center">����</td>
	      	<td><input name="title" size="48" maxlength="100"></td>
	      	<td>&nbsp;</td>
	      	</tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
    <tr>
    
    <%if(dto==null){ %>
	      <td>&nbsp;</td>
	      <td align="center">�̸�</td>
	      <td><input name="name" size="48" maxlength="50"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">��й�ȣ</td>
	      <td><input type="password" name="password" size="48" maxlength="50"></td>
	      <td>&nbsp;</td>
      <%}else{ %>
	      <td>&nbsp;</td>
	      <td align="center">�̸�</td>
	      <td><input name="name" size="48" maxlength="50" value="<%=dto.getName() %>"></td>
	      <td>&nbsp;</td>
	     </tr>
	      <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="center">��й�ȣ</td>
	      <td><input type="password" name="password" size="48" maxlength="50" value="<%=dto.getPw()%>"></td>
	      <td>&nbsp;</td>
      <%} %>
     </tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">����</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      <input type="submit" class="btn" style=" width: 100px; height:40px; margin-top: 10px;" value="���" OnClick="javascript:writeCheck();">       
      <!-- ��� ��ư�� ������ writeCheck() �Լ��� ���� �˻縦 �ϰ� �̻��� ������ form.submit()���� write_ok.jsp�� ���� ������ �� -->
       <input type="button" class="btn" style=" width: 100px; height:40px; margin-top: 10px;" value="���" OnClick="javascript:history.back(-1)"/>
       
      
       <!-- ��� ��ư�� ������ �ڷΰ��� �ڵ��� history.back()�� ���� -->
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