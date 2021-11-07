<%@page import="data.dto.LoginDto"%>
<%@page import="data.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
img {
	align-content: center;
	margin-left: 700px;
}

.line {
	border-bottom: 1px solid lightgray;
}

th {
	height: 50px;
}
</style>
</head>
<%
/* //id읽기
String id = request.getParameter("id");

//dao선언
LoginDao dao = new LoginDao();

//dto얻기
LoginDto dto = dao.getById(id); */

String myid = (String) session.getAttribute("myid");
LoginDao dao = new LoginDao();
LoginDto dto = dao.getById(myid);
String nick = dao.getNick(myid);

%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 마이페이지';
</script>
<br>
<br>
<b style="text-align: center;"><h2>프로필</h2></b>
<hr><br>
<% 
if(dto.getPhoto()!=null) {
	%> 
	<form action="realindex.jsp?main=gaip/updateform.jsp" method="post" name = "frm"">
	
	<input type="hidden" name="num" value="<%= dto.getNum()%>">
	<div align="center">
	<img alt="" src="save/<%=dto.getPhoto()%>" class="photo" align="center"
	style="width: 100px; height: 100px; border-radius: 70%; margin: 0 auto;">
	
	<%
}
%>
<span style="font-size: 15pt; font-weight: bold; margin: 0 auto;"><%=nick %> (<%=myid %>)</span><br>
</div>
<table style="width: 400px; margin: auto;">

	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer;" onclick="#">
			<span style="font-size: 10pt; font-weight: normal;">설정</span>
		</th>
	</tr>

	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="updateMyid()">
			내 정보 수정 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="location.href='realindex.jsp?main=yeyak/yeyaklist.jsp'">
			예약 내역 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="#" class="line">
			결제 카드 정보 관리 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer;" onclick="#">
			<span style="font-size: 10pt; font-weight: normal;">고객센터</span>
		</th>
	</tr>
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="#">
			1:1문의 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="#">
			개선 제안하기 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	<tr>
		<th style="font-size: 13pt; font-weight: bold; cursor: pointer; width: 50px;" onclick="#" class="line">
			공지사항 및 이용약관 <span style="float: right;" class="glyphicon glyphicon-chevron-right"></span>
		</th>
	</tr>
	
	
</table>

</form>
<br>
<hr>

<br>
<hr>

<script type="text/javascript">

function updateMyid() {
	
	var f = document.forms.frm;
	 
	f.submit();
}

</script>

</body>
</html>