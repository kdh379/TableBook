<%@page import="data.dao.LoginDao"%>
<%@page import="data.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="../assets/logo1.ico" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">


<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<%
	//프로젝트의 경로
	String root=request.getContextPath();
	
	LoginDao ldao = new LoginDao();
	
	
	/* String shop_num = request.getParameter("shop_num");
	String myid = (String) session.getAttribute("myid");
	String login_num = ldao.getNumById(myid);
	String writer = ldao.getOneData(login_num).getNick();
	*/
	String writer="jiwon";
	String score = "0";
	String login_num = "1";
	String shop_num = "13";
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
	
</head>
<body>

<form action="reviewaction.jsp" method="post">

	<table class="table table-bordered" style="width: 800px;margin-left: 100px;">
		<caption style="margin-bottom: 30px;"><b style="color: orange; font-size: 16pt;">허브족발</b>  
		에 대한   <b style="font-size: 12pt;"><%=writer %></b>님의 솔직한 리뷰를 써주세요.</caption>
		
		<tr>
		  <td>
		  
		  <!-- 평점주는버튼들 -->
		  <button type="button" class="score" value="5" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/5점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		  <button type="button" class="score" value="4" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/4점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		  <button type="button" class="score" value="3" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/3점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		  <button type="button" class="score" value="2" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/2점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		  <button type="button" class="score" value="1" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/1점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		  <button type="button" class="score" value="0" style="border: none; background-color: white;">
		  <img alt="" src="../imgs/0점.PNG" 
		  style="width: 50px; height: 50px; opacity: 0.3"></button>
		    <br>
		     <font style="margin-left: 7px; ">Good(5)</font>
		     <font style="margin-left: 16px; ">Like(4)</font>
		     <font style="margin-left: 16px; ">Soso(3)</font>
		     <font style="margin-left: 16px; ">Um..(2)</font>
		     <font style="margin-left: 16px; ">Bad(1)</font>
		     <font style="margin-left: 16px; ">Hate(0)</font>
		  </td>
		  
		</tr>
		
		
		
		<tr>
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;"></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-warning"
					style="width: 200px;"
					onclick="submitContents(this)">작성완료</button>
				
				
			</td>
		</tr>
		
	</table>   
	<!-- writer와 score값 넘기기위한 hidden -->
	<input type="hidden" name="score" value="<%= score%>">
	<input type="hidden" name="writer" value="<%=writer %>">
	<input type="hidden" name="shop_num" value="<%=shop_num %>">
	<input type="hidden" name="login_num" value="<%=login_num %>">
	
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}

//점수주기

/* $(".score").click(function(){
	
	$(this).children().css({"opacity":"1.0"});
	score = $(this).val();
	console.log(score);
	
	$(this).siblings().attr({"disable":"false"});
	
}); */
$(document).on("click", ".score", function () {
	$(this).children().css({"opacity":"1.0"});
	score = $(this).val();
	
	
	$(this).siblings().prop("disabled", true);
  });
</script>

</body>
</html>






















