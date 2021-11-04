<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.Vector"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">
<style type="text/css">
h3{
	margin-top: 70px;
	margin-left: 70px;

}

hr{
	border: 0;
    height: 1px;
    background: #ccc;
    width: 700px;
    margin-left: 70px;
    float: left;
    margin-bottom: 20px;
}

table#info{
	
	margin-left: 70px;
	margin-bottom: 70px;
}

table#info tr{
	line-height: 30px;
}

table#info tr th{
	color: #a9a9a9  ;
}

/* table#info tr td{
	font-weight: bold;
} */


div.review{
	margin-left: 70px;

}
</style>
<title>Insert title here</title>
</head>
<%
//shop의 num
/* String num = request.getParameter("num"); */
String num = "13";

ShopDao shdao = new ShopDao();
ShopDto shdto = shdao.getOneShop(num);

MenuDao mdao = new MenuDao();
Vector<MenuDto> mlist = mdao.getMenu(num);


%>
<body>
<h3><b><%=shdto.getName() %></b><font color="orange" style="margin-left: 20px;">4.6</font></h3>
<hr>

<div style="clear: both;"></div>


<table id="info" style="width: 700px;">
  <tr>
    <th width="100px">주소</th>
    <td><%=shdto.getAddr() %></td>
  </tr>
  
  <tr>
    <th width="100px">전화번호</th>
    <td><%=shdto.getTelephone() %></td>
  </tr>
  
  <tr>
    <th width="100px">음식 종류</th>
    <td><%=shdto.getTag() %></td>
  </tr>
  
  <tr>
    <th width="100px">주차</th>
    <td>주차 공간 <%=shdto.getParking() %></td>
  </tr>
  
  <tr>
    <th width="100px">영업 시간</th>
    <td><%=Integer.toString(shdto.getOpening())  %>:00 - <%=Integer.toString(shdto.getClosing())  %>:00</td>
  </tr>
  
  <tr>
  <th width="100px" rowspan="<%=mlist.size() %>" style="vertical-align: top;">메뉴</th>
  <%
  for(int i=0; i<mlist.size(); i++){
	  
	  MenuDto mdto = mlist.get(i);
  
  %>
	  
  
    
    <td><%=mdto.getMenu() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=mdto.getPrice() %>원</td>
    
  </tr>
	  
  <%}
  
  
  %>
  
  


</table>

<hr>

<div style="clear: both;"></div>

<div class="review">
  <jsp:include page="reviewlist.jsp"/>
</div>










</body>
</html>