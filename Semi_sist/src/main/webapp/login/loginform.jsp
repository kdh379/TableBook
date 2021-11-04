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
<title>로그인 폼</title>
</head>
<%
String saveok = (String) session.getAttribute("saveok");
String myid = "";

if(saveok != null){
	myid = (String) session.getAttribute("myid");
}

%>
<body>
<div style="margin-left: 130px;">
  <form action="login/loginaction.jsp" method="post" class="form-inline">
    <table class="table table-bordered" style="width: 300px;">
      <caption><b>세션 로그인</b></caption>
        <tr>
          <td colspan="2" align="center">
          
          	<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked"%>>아이디저장
          
          </td>
        </tr>
        <tr>
          <th width="100" bgcolor="lightyellow" style="text-align: center;">아이디</th>
         
          <td>
            <input type="text" name="id" class="form-control" autofocus="autofocus"
            required="required" style="width: 120px;" value="<%= myid%>">
          </td>
         
          
        </tr>
        
        <tr>
          <th width="100" bgcolor="lightyellow" align="center" style="text-align: center;">비밀번호</th>
          <td>
            <input type="password" name="pass" class="form-control"
            required="required" style="width: 120px;">
          </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <button type="submit" class="btn btn-info" style="width: 100px;">로그인</button>
            <button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='realindex.jsp?main=gaip/gaipform.jsp'">회원가입</button>
          </td>
        </tr>
		
		<tr>
		<td colspan="2" align="center">
		<b>간편로그인</b>
		<br>
		<button type="button" class="btn btn-warning" style="width: 100px;" onclick="location.href='index.jsp?main=sns/kakao_login.html'">카카오</button>
		<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='realindex.jsp?main=sns/naver_login.html'">네이버</button>
		</td>
		<br>
		
    	</tr>
    </table>
  
  </form>
  
</div>
</body>
</html>