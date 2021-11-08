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
<title>Insert title here</title>
</head>
<body>
<%
String shop_num = request.getParameter("shop_num");
String loginok = (String)session.getAttribute("loginok");

if(loginok==null){%>
	<script type="text/javascript">
	alert("로그인 후 이용 가능한 서비스입니다.");
	history.back();
	</script>
<%
	
}else{
	response.sendRedirect("../realindex.jsp?main=res/resform.jsp?shop_num="+shop_num);
}

%>
</body>
</html>