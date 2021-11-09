<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="data.dto.ResDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ResDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src = "https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
.line {
	border-bottom: 1px solid lightgray;
}
</style>
</head>
<%

String root = request.getContextPath();

//방금 예약한 데이터 가져오기
ResDao dao = new ResDao();
ResDto dto = dao.getLatestData();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 예약완료';
</script>
<div style="display: block; margin-left: auto; margin-right: auto; width: 500px; margin-bottom: -35px;">
<img alt="" src="<%=root %>/assets/logo1.ico"><br>
<hr style="border: 0; width: 500px; height: 2px; background-color: orange; position: absolute;"><br><br><br>

<span style="font-size: 2em; font-weight: bold;">예약이 정상적으로 완료</span>
<span style="font-size: 2em;">되었습니다!</span><br><br><br>

<span style="font-size: 13pt; color: red;" class="glyphicon glyphicon-ok">예약내역확인</span><br><br>
<table style="font-size: 13pt;">
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>음식점명</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=dto.getShop_name() %>
		</td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>구매일</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=sdf.format(dto.getPaymentdate()) %>
		</td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>예매번호</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=dto.getNum() %>
		</td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>예약일시</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=dto.getRes_date() %>
		</td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>좌석정보</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=dto.getSeat() %>
		</td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#FDE8C8" class="line"><b>결제금액</b></th>
		<td width="500" class="line">
			&nbsp;&nbsp;<%=dto.getPrice() %>원
		</td>
	</tr>
</table>

<br>

<button type="button" class="btn btn-info" style="width: 50px; height: 40px; margin-left: 350px;" onclick="location.href='<%=root %>/index.jsp'"
style="float: right;">홈</button> <!-- 메인폼으로 -->
<button type="button" class="btn btn-warning" style="width: 80px; height: 40px; margin-left: 10px;"
onclick="location.href='<%=root %>/realindex.jsp?main=shop/shopform.jsp?num=<%=dto.getShop_num() %>'" 
style="float: right; margin-right: 15px;">식당 정보</button> <!-- 음식점폼으로 -->

<br><br><br>


</div>
</body>
</html>