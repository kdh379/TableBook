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
<title>로그인 메인</title>
</head>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 로그인';
</script>
<%
String loginok = (String) session.getAttribute("loginok");
String prePage = "";

if(request.getParameter("prePage") ==null){
	prePage = "index.jsp";
}else{
	prePage = request.getParameter("prePage");
}

if(loginok == null){%>
	
	<jsp:include page="loginform.jsp">
		<jsp:param value="<%=prePage %>" name="prePage"/>
	</jsp:include>
<%}else{%>

	<jsp:include page="logoutform.jsp"/>
<%}
%>


</body>
</html>