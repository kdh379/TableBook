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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	
	//사용할 앱의 JavaScript 키를 설정해주세요.
	Kakao.init("2bbc6c8821bacf88178635f1e2c97dd0");
	
	Kakao.Auth.authorize({
		redirectUri: 'http://localhost:8080/Semi_sist/realindex.jsp?main=sns/kakaoRedirectForm.jsp',
	});
	
	/* Kakao.Auth.login({
		success: function(authObj) {
			
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res) {
					console.log(res);
					var email = res.kakao.account.email;
					var name=res.properties.nickname;
				
					location.href='kakaoRedirectForm.jsp?email='+email+'&name='+name;
				}
			});
			
				console.log(authObj);
			var token=authObj.access_token;
		},
		fail:function(err){
			alert(JSON.stringify(err));
		}
	} */
</script>

</body>
</html>