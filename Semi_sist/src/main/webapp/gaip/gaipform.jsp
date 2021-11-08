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
<style type="text/css">
#gaipform{
	font-size: 14pt;
 	margin-top: 30px;
	margin-bottom: 30px;
	
}

input{
 border: none;
}

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid lightgray;
    padding: 10px;
    height: 80px;
  }

</style>

<script type="text/javascript">
	$(function() {

		//이메일 선택 이벤트
		$("#selemail").change(function() {

			if ($(this).val() == '-') {
				$("#email2").val(''); //지정된 메일 지우기
				$("#email2").focus(); //포커스주기

			} else {
				$("#email2").val($(this).val());
			}

		});

		$("#btnidcheck").click(function() {
			window.open("gaip/idsearch.jsp", "",
					"width=600px, height=200px, left=500px, top=100px");
		});

	});

	//check
	function check(f) {

		if (f.id.value.length == 0) {
			alert("아이디 입력을 해주세요");
			return false;
		}

		if (f.pass.value != f.pass2.value) {

			alert("비밀번호가 서로 다릅니다");
			f.pass.value = "";
			f.pass2.value = "";
			return false; //action 이 호출되지않는다

		}

	}
</script>
</head>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 회원가입';
</script>
<form action="gaip/gaipadd.jsp" method="post" class="form-inline" name="gaipfrm"
onsubmit="return check(this)" enctype="multipart/form-data">
  <div align="center" id="gaipform">
  <table style="width: 700px;">
    <caption><b>회원가입</b></caption>
      <tr>
        <th width="200">아이디</th>
          <td>
            <input type="text" name="id" maxlength="8" class="form-control"
            required="required" style="width: 500px; border: none; color: #fff" readonly="readonly">
            
            <button type="button" style="width: 80px; height: 30px; background-color: rgb(254,225,14); color: rgb(108,117,126);  border: none; border-radius: 10px; box-shadow: 1px 1px; font-size: 10pt; margin-top: 10px;"  id="btnidcheck">아이디입력</button>
          </td>
      </tr>
      
      <tr>
        <th width="200">비밀번호</th>
          <td>
            <input type="password" name="pass" class="form-control"
            required="required" style="width: 500px; border: none;" placeholder="비밀번호">
            
            <input type="password" name="pass2" class="form-control"
            required="required" style="width: 500px; border: none;" placeholder="비밀번호확인">
            
            
          </td>
      </tr>
      
      <tr>
        <th width="200">닉네임</th>
          <td>
            <input type="text" name="nick" class="form-control"
            required="required" style="width: 500px; border: none;">
            
          </td>
      </tr>
      
      <tr>
        <th width="200">핸드폰</th>
          <td>
            <input type="text" name="hp" class="form-control"
            required="required" style="width: 500px; border: none;">
            
          </td>
      </tr>
      
      <tr>
        <th width="200">이메일</th>
          <td>
            <input type="text" name="email1" class="form-control"
            required="required" style="width: 150px; border: none;">
            <b>@</b>
            <input type="text" name="email2" class="form-control"
            id="email2"
            required="required" style="width: 200px; border: none;">
            
            <select id="selemail" class="form-control" style="width: 115px">
              <option value="-">직접입력</option>
              <option value="naver.com">네이버</option>
              <option value="gmail.com">구글</option>
              <option value="hanmail.net">다음</option>
            </select>
          </td>
      </tr>
      
      <tr>
        <th width="200" style="border-bottom: 1px solid #444444;">이미지 업로드</th>
          <td style="border-bottom: 1px solid #444444;">
            <input type="file" name="photo" class="form-control"
            required="required" style="width: 500px; border: none;">
            
          </td>
      </tr>
      
  </table>

	  <div style="margin-top: 20px; margin-left: 500px;">
          <button type="submit" class="btn btn-warning" style="width: 80px; margin-right: 10px;">저장하기</button>
          <button type="reset" class="btn btn-danger" style="width: 80px;">다시하기</button>
      </div>
      
  </div>
</form>
</body>
</html>