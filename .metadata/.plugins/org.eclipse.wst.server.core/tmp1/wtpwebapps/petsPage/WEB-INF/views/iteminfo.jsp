<%@page import="com.zip4s.pets.dto.CustomerDTO"%>
<%@page import="com.zip4s.pets.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
    <%
		ProductDTO pdto = (ProductDTO) request.getAttribute("item_info");
		
		int pno = pdto.getPno();
		String name = pdto.getPname();
		String img = pdto.getPimg();
		String img2 = pdto.getPimg2();
		int price = pdto.getPrice();
	%>
	

  </head>
  <body>
  
  
    <br>
	<%
	CustomerDTO dto = (CustomerDTO) session.getAttribute("login_info");
		if (dto == null) {
	%>


	<div id="Nav_menu">
		<ul>
			<li><a href="login"> 로그인 </a></li>
			<li><a href="join">회원가입</a></li>
			<li>마이페이지</li>
			<li>장바구니</li>
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
			<li>장바구니</li>
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
	<form action="ProductServlet?Action=SRH" method="post">
		<div class="input-group" style="margin-left: 25%; width: 50%;">
			<input type="text" class="form-control" name="text"
				placeholder="찾을 물건을 검색하라멍!"> <span class="input-group-btn">
				<button class="btn btn-secondary" type="submit">찾기</button>
			</span>
		</div>
	</form>

      <br><br><br><br>





	<div><img src="<%= img %>" style="margin-left:10%;"></img>
        <div style="float:right; margin-right:30%;">
          <br><br>
          <h5>상품명</h5>
          <h3><%= name %></h3>
          <br><br>
          <h5>가격</h5>
          <h3><%= price %>원</h3>
          <br><br>
          <h5>수량</h5>
          <table>
            <form name="frm">
            <tbody>
              <tr>
                <td>
                 <input type="text" name="ea" class="form" size="2" value="0" maxlength="2" onblur="numcheck(this.form.ea.value,10)" onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">
               </td><td valign="middle" height="30">
                   <input type="button" value="▲" onclick="up(this.form.ea.value,10)"
                   style="background-color:white; border:0; height:14px; font-size:12px " name="plus">
                   <br>
                   <input type="button" value="▼" onclick="down(this.form.ea.value)" style="background-color:white; border:0; height:14px; font-size:12px" name="minus">
                 </td>
               </tr>
             </tbody>
           </form>
         </table>


          <br><br>
		
          <div class="dropdown" >
            <input type="submit" class="dropbtn" value="주문하기" disabled="disabled">
          </div>
       
          <div class="dropdown" >
            <a href="javascript:popupOpen();"><input type="submit" class="dropbtn" value="장바구니"/></a>
          </div>
        </div>
      </div>
      <div style="border-bottom:1px solid #cccccc;"></div>
      <div><img src="<%=img2 %>" style="margin-left:25%;"></img></div>
      <br><br><br><br><br><br><br><br><br><br><br><br><br>
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
    <script type="text/javascript">
		
		
      	function numcheck(val,jaego){
                            if (val>jaego-1){
                                    alert("재고량이 없습니다")
                                    document.frm.ea.value=jaego}
                            else if (val<2){
                                    document.frm.ea.value=1        }
            }
    	function up(val,jaego){
                            if (val>jaego-1){
                                    alert("재고량이 없습니다")
                                    document.frm.ea.value=jaego}
                            else{
                                    document.frm.ea.value=(val/1)+1}
	    }
	
	    function down(val){
	                            if (val<2){
	                                    document.frm.ea.value=1}
	                            else{
	                                    document.frm.ea.value=val-1}
	    }
	    
	    var pno = "<%= pno %>";
	    var item = document.getElementById('item').value;
		var name = "<%=name %>";
		var price = "<%= price %>";
	    function popupOpen(){
	        var popUrl = "cartcheck.jsp?&pno=" +pno+"&item"+ item + "&name=" + name + "&price=" + price;
	        var popOption = "width=300, height=200, resizable=no, scrollbars=no, status=no;";
	           window.open(popUrl,"",popOption);
	        }
	</script>







  </body>
</html>
