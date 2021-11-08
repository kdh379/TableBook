<%@page import="java.net.URLEncoder"%>
<%@page import="javax.swing.text.Document"%>
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
<title>로그아웃 액션</title>
</head>
<body>
<%
session.removeAttribute("loginok");

/* var referrer=document.referrer;*/
String prePage=request.getParameter("prePage");
String search = "";
if(request.getParameter("search")==null){
	search=" ";
}else{
	search = request.getParameter("search");
}
if(request.getParameter("prePage")==null||prePage.equals("index.jsp")){
	response.sendRedirect("../index.jsp");
}else if(prePage.equals("gaip/mypageform.jsp")) {
	response.sendRedirect("../index.jsp");
	return;
}
else{
	String encoding = URLEncoder.encode(search);
	response.sendRedirect("../realindex.jsp?main="+prePage+"&search="+encoding);
}




/* String str1 = prePage.substring(0, prePage.length()-search.length());
String str2 = prePage.substring(prePage.length()-search.length()); */
//System.out.print(prePage);
/* System.out.println(str1);
System.out.println(str2); */





%>
</body>
</html>