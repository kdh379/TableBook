<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html bgproperties="fixed" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
<script language="javascript">
	
	var walletAddress;
	var totalReceived;
	var Key;
	var txIDarray=null;
	var txID = null;
	
	//API 끌어오기(ajax 동기식)
	function api(code) {
		
		var grant_type = "authorization_code";
		var client_id="e81d7291b30b702409a60afcc2d361ff";
		var redirect_uri="http://localhost:8080/Semi_sist/sns/kakaoRedirectForm.jsp";
		var code = code;
		
		$.post("https://kauth.kakao.com/oauth/token", {grant_type:grant_type, client_id:client_id, redirect_uri:redirect_uri, code:code},
		
			var access_token = data['access_token']
		$('body').append(access_token+'<br>'); //액세스토큰값 출력
		$('body').append()
		)
		
	}
	
</script>

<!-- <script type="text/javascript">
	
//var client_email = null;

//<![CDATA
	//사용할 앱의 JavaScript 키를 설정해주세요.
	Kakao.init("2bbc6c8821bacf88178635f1e2c97dd0");
	
	Kakao.Auth.login({
		success: function(authObj) {
			
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res) {
					console.log(res);
					
					var id=res.id; //데이터베이스 primary Key값 속성 측 기본치의 식별성
					var email = res.kakao_account.email;
					var name=res.properties.nickname;
					var html = '<br>'+email+'<br>'+name;
					
					$('body').append(html);
				}
			});
			
				console.log(authObj);
			var token=authObj.access_token;
		},
		fail:function(err){
			alert(JSON.stringify(err));
		}
	});
</script> -->
</body>
</html>