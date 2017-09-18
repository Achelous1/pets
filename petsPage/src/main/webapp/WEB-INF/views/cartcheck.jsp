<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.zip4s.pets.dto.ProductDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Pet's </title>

<script language="javascript">
//그냥 취소 버튼
function move1() {
  self.close();
}
//장바구니 보는 버튼 함수 <- 여기도 에러 다에러 그냥 에러... ㅈ댐
function move2() {
     opener.location.href="ProductServlet?action=CART";
     self.close();
}
</script>
</head>
<body>
<%
	//전달받은 장바구니 값을 세션에 저장
	String item = request.getParameter("item");
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	ProductDTO pdto = new ProductDTO();
	ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)session.getAttribute("list_cart");
	pdto.setPno(2);
	pdto.setItem(item);
	pdto.setName(name);
	pdto.setPrice(price);
	
	//에러 고쳐야 할 곳
	list.add(pdto);
	session.setAttribute("list_cart", list); 
%>
<center>
<h3>장바구니로 이동되었습니다.</h3>
<br><br><br><br>
 <input type="button" onclick = "move1();" value="계속 쇼핑 하기"/>
 <input type="button" onclick="move2();" value="장바구니로"/>
</center>
</body>
</html>