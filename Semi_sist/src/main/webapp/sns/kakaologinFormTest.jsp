<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html bgproperties="fixed" oncontextmenu="return false" ondragstart="return false">
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Kakao API예제</title>
</head>
<body>
리다이렉트 예제 - authorize, login, loginform <br>
<a href="kakaologin1.jsp">로그인이동</a><p>

페이지 내 처리 예제 - createLoginButton<br>
<a id="kakao-login-btn"></a><br>

<p>
<a href="https://developers.kakao.com/logout">로그아웃</a>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	
	//var client_email = null;
	
	//<![CDATA
		//사용할 앱의 JavaScript 키를 설정해주세요.
		Kakao.init("2bbc6c8821bacf88178635f1e2c97dd0");
		//카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj) {
				url:'/v2/user/me',
				success: function(res) {
					console.log(res);
					var id=res.id; //데이터베이스 primary Key값 속성 측 기본치의 식별성
					var email = res.kakao_account.email;
					var name=res.properties.nickname;
					var image=res.properties.profile_image;
					var html = '<br>'+email+'<br>'+name;
					
					html+='<br><img src="' + image + '">';
				}
			}
		});
</script>
</p>
</body>
</html>