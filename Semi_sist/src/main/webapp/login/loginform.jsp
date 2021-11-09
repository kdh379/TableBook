 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%--
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
  rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<title>로그인 폼</title>
</head>
<%
String saveok = (String) session.getAttribute("saveok");
String myid = "";
String prePage = request.getParameter("prePage");

if(saveok != null){
	myid = (String) session.getAttribute("myid");
}

%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 로그인';
</script>
<br>
<br>
<b style="text-align: center;"><h2>로그인</h2></b>
<hr>
<div align="center">
  <form action="login/loginaction.jsp" method="post" class="form-inline">
    <table class="table table-bordered" style="width: 400px; margin: auto;">
      <caption><b style="font-size: 15pt; font-weight: bold; margin: auto;">세션 로그인</b></caption>
      
        <tr>
          <td colspan="2" align="center">
          
          	<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked"%>>아이디저장
          
          </td>
        </tr>
        <tr>
          <th width="120" bgcolor="lightyellow" style="text-align: center; font-size: 12pt;">아이디</th>
         
          <td>
            <input type="text" name="id" class="form-control" autofocus="autofocus"
            required="required" style="width: 200px; margin-left: 10px;" value="<%= myid%>">
          </td>
         
          
        </tr>
        
        <tr>
          <th width="120" bgcolor="lightyellow" align="center" style="text-align: center; font-size: 12pt;">비밀번호</th>
          <td>
            <input type="password" name="pass" class="form-control"
            required="required" style="width: 200px; margin-left: 10px;">
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
		<button type="button" class="btn btn-warning" style="width: 100px;" onclick="location.href='realindex.jsp?main=sns/kakaologinFormTest.jsp'">카카오</button>
		<div id="naver_id_login"></div>
		</td>
		<br>
		
    	</tr>
    </table>
  <input type="hidden" name="prePage" value="<%=prePage%>">
  </form>
  
</div> --%>


<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="stylesheet" href="./login.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 645px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.login {
	width: 400px;;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	color: tomato;
	font-size: 2em;
}

.login_sns {
	padding: 20px;
	display: flex;
}

.login_sns li {
	padding: 0px 15px;
}

.login_sns a {
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	border-radius: 50px;
	background: white;
	font-size: 20px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px
		rgba(0, 0, 0, 0.1);
}

/* border: solid 1px white; border-radius: 100%; max-width: 60px; */

.login_id {
	margin-top: 20px;
	width: 80%;
}

.login_id input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 20px;
	width: 80%;
}

.login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 10px;
}

.submit {
	margin-top: 50px;
	width: 80%;
}

.submit input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}

.subwrap{
	margin: 0 auto;
	

}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

 String saveok = (String) session.getAttribute("saveok");
String myid = "";
String prePage = request.getParameter("prePage");
String search = request.getParameter("search");
if(search!=null) {
	prePage += "&search=" + search;
}

if(saveok != null){
	myid = (String) session.getAttribute("myid");
} 

%>
	<div class="wrap">
		<div class="login">
			<h2>Log-in</h2>
			
			 <form action="login/loginaction.jsp" method="post" class="form-inline">
			 <div class="subwrap">
			<div class="login_sns">
				<!-- <li><a href=""></a></li> -->
<!-- 				<button type="button" class="btn btn-warning" style="width: 100px;" onclick="location.href='realindex.jsp?main=sns/kakaologinFormTest.jsp'">카카오</button>
 -->				
				<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=e81d7291b30b702409a60afcc2d361ff&redirect_uri=http://localhost:8080/Semi_sist/sns/kakaoRedirectForm.jsp&response_type=code"
				style="margin-left: 30px;">
				<img src="imgs/kakaoicon.jpg" style="border: solid 1px white; 
				border-radius: 100%; max-width: 60px;"></a></li>
				 <li><a href="sns/naver_login.html"> 
				<!-- <li><a onclick="window.open('sns/naver_login.html', '_blank', 'width=200, height=50'); return false;" 
				style="cursor: pointer;"> -->
				<img src="imgs/navericon.jpg" style="border: solid 1px white; border-radius: 100%; max-width: 60px;"></a></li>
			</div>
			<div class="login_id">
				<h4 style=" margin-left: 30px;">ID</h4>
				<input type="text" name="id" id="" placeholder="Id" style=" margin-left: 30px;" value="<%= myid%>">
			</div>
			<div class="login_pw">
				<h4 style=" margin-left: 30px;">Password</h4>
				<input type="password" name="pass" id="" placeholder="Password" style=" margin-left: 30px;">
			</div>
			<div class="login_etc" style="margin-left: 30px;">
				<div class="checkbox">
					<input type="checkbox" name="cbsave" id="" <%=saveok==null?"":"checked"%>> Save ID
				</div>
				
				<div class="forgot_pw">
					<a href="realindex.jsp?main=gaip/gaipform.jsp">Join us</a>
				</div>
			</div>
			<div class="submit" style="margin-left: 30px;">
				<input type="submit" value="login" >
			</div>
			
			<input type="hidden" name="prePage" value="<%=prePage%>">
			</div>
			</form>
			<!-- <div id="naver_id_login"></div>  -->
			
		</div>
	</div>
<!-- <script type="text/javascript">
 
	/* var naver_id_login = new naver_id_login("gmeR75V0A8r7JpS270pi", "http://localhost:8080/Semi_sist/realindex.jsp?main=sns/naver_callback.html"); */
	var naver_id_login = new naver_id_login("nxtYWqsr4vw2nACnPJZp", "http://localhost:8080/Semi_sist/sns/naver_callback.html");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 3,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup(false);
	naver_id_login.init_naver_id_login();
</script> 
 -->
 <!-- <script type="text/javascript">
	// �꽕�씠踰� �궗�슜�옄 �봽濡쒗븘 議고쉶 �씠�썑 �봽濡쒗븘 �젙蹂대�� 泥섎━�븷 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('�봽濡쒗븘�빆紐⑸챸');
		// �봽濡쒗븘 �빆紐⑹� 媛쒕컻媛��씠�뱶瑜� 李멸퀬�븯�떆湲� 諛붾엻�땲�떎.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}


	// �꽕�씠踰� �궗�슜�옄 �봽濡쒗븘 議고쉶
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	
	//濡쒓렇�븘�썐 李� �뿴湲� (二쇱냼蹂듭궗)
	/* https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=gmeR75V0A8r7JpS270pi&client_secret=lT5EyddEbA&access_token=AAAAOCj0coUcriQIiRH9gdUMCGaU2oLPB4L93GgSyORnX_y5brM_2a_A-DJR244UavKbOqBMN7V6bnJKH7eGI9rndu8&service_provider=NAVER */
</script> -->

</body>
</html>