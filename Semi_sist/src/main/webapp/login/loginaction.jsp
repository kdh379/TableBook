<%@page import="data.dao.LoginDao"%>
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
<title>로그인 액션</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String cbsave = request.getParameter("cbsave");  //체크안하면 null 체크하면 on
String prePage = request.getParameter("prePage");

LoginDao dao = new LoginDao();
boolean b = dao.isIdPass(id, pass);
//아이디와 비번이 맞으면 3개세션 저장
//로그인메인 
if(b){
	
	//세션유지시간(생략시 30분)
	session.setMaxInactiveInterval(60*60*2);   //2시간
	session.setAttribute("loginok", "yes");   //로그인 성공 표시
	session.setAttribute("myid", id);  // 로그인한 아이디
	session.setAttribute("saveok", cbsave==null?null:"yes");  //아이디 저장 체크시
	
	//로그인 메인으로 이동
	if(prePage.equals("index.jsp")){
		response.sendRedirect("../index.jsp");
	}else{
		response.sendRedirect("../realindex.jsp?main="+prePage);
	}
	
	
}else{%>
	
	<script type="text/javascript">
	  alert("아이디 또는 비밀번호가 일치하지 않습니다");
	  history.back();
	
	</script>
	
<%}
	



%>
</body>
</html>