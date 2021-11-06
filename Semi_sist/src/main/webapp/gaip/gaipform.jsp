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
  <table class="table table-bordered" style="width: 500px;">
    <caption><b>회원가입</b></caption>
      <tr>
        <th width="100" bgcolor="#aaa">아이디</th>
          <td>
            <input type="text" name="id" maxlength="8" class="form-control"
            required="required" style="width: 120px;" readonly="readonly">
            
            <button type="button" class="btn btn-danger btn-sm" id="btnidcheck">아이디입력</button>
          </td>
      </tr>
      
      <tr>
        <th width="100" bgcolor="#aaa">비밀번호</th>
          <td>
            <input type="password" name="pass" class="form-control"
            required="required" style="width: 120px;" placeholder="비밀번호">
            
            <input type="password" name="pass2" class="form-control"
            required="required" style="width: 120px;" placeholder="비밀번호확인">
            
            
          </td>
      </tr>
      
      <tr>
        <th width="100" bgcolor="#aaa">닉네임</th>
          <td>
            <input type="text" name="nick" class="form-control"
            required="required" style="width: 120px;">
            
          </td>
      </tr>
      
      <tr>
        <th width="100" bgcolor="#aaa">핸드폰</th>
          <td>
            <input type="text" name="hp" class="form-control"
            required="required" style="width: 200px;">
            
          </td>
      </tr>
      
      <tr>
        <th width="100" bgcolor="#aaa">이메일</th>
          <td>
            <input type="text" name="email1" class="form-control"
            required="required" style="width: 80px; ">
            <b>@</b>
            <input type="text" name="email2" class="form-control"
            id="email2"
            required="required" style="width: 120px; ">
            
            <select id="selemail" class="form-control" style="width: 100px">
              <option value="-">직접입력</option>
              <option value="naver.com">네이버</option>
              <option value="gmail.com">구글</option>
              <option value="hanmail.net">다음</option>
            </select>
          </td>
      </tr>
      
      <tr>
        <th width="100" bgcolor="#aaa">이미지 업로드</th>
          <td>
            <input type="file" name="photo" class="form-control"
            required="required" style="width: 300px;">
            
          </td>
      </tr>
      
      <tr>
        <td colspan="2" align="center">
          <button type="submit" class="btn btn-success" style="width: 100px;">저장하기</button>
          <button type="reset" class="btn btn-danger" style="width: 100px;">다시하기</button>
        </td>
      </tr>
  </table>

</form>
</body>
</html>