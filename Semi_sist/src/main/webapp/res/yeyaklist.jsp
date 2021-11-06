<%@page import="data.dto.ResDto"%>
<%@page import="data.dao.LoginDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ResDao"%>
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

<title>예약관리 버튼 눌렀을 때 나오는 화면</title>
</head>
<%
//로그인 상태 확인 후 보여주기
String loginok = (String)session.getAttribute("loginok");

ResDao dao = new ResDao();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 예약정보';
</script>
<%
if(loginok!=null) { //로그인 중일때만 폼 보이게 하기
	%>
	<jsp:include page="yeyaklist.jsp"/>
	<hr align="left" width="700">	
<%}
%>
<!-- 예약정보 전체출력 -->
<div>
	<b>예약정보</b>
<%
LoginDao ldao = new LoginDao();

/* for(ResDto dto:list) {
		
} */
%>
</div>
</body>
</html>