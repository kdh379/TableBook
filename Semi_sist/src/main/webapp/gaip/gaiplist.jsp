<%@page import="data.dto.LoginDto"%>
<%@page import="java.util.Vector"%>
<%@page import="data.dao.LoginDao"%>
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
tr {
	
}
</style>
<title>회원명단</title>

</head>
<body>
<%
LoginDao dao = new LoginDao();
Vector<LoginDto> list = dao.getAllDatas();

%>

	<table class="table table-bordered"
		style="width: 900px; border: 1px solid lightgray">
		<caption>
			<b>회원 리스트</b>
		</caption>
		<tr bgcolor="#b0c4de">
			<th width="30">번호</th>
			<th width="50">닉네임</th>
			<th width="50">아이디</th>
			<th width="100">핸드폰</th>
			<th width="100">이메일</th>
			<th width="60">수정/삭제</th>
		</tr>

		<%
  for(int i=0; i<list.size(); i++){
	  LoginDto dto = list.get(i);
  %>
		<tr>
			<td><%=list.size()-i %></td>
			<td>
				<%
	    if(dto.getPhoto()!=null){%> <img alt=""
				src="photo/<%=dto.getPhoto()%>" class="photo" align="left"> <%}
	    
	    %> <%=dto.getNick() %>
			</td>

			<%-- <td>
	     <img alt="" src="../photo/<%=dto.getPhoto()%>" style="width: 30px; height: 30px;">
	         <%=dto.getNick() %>
	  </td> --%>

			<td><%=dto.getId() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getEmail() %></td>
			<td>
				<button type="button" class="btn btn-info btn-xs"
					onclick="location.href='realindex.jsp?main=gaip/updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-xs"
					onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
			</td>
		</tr>
		<%}
  
  %>


	</table>
	<!-- 삭제 모달창과 자바스크립트 코드 추가 -->

	<!-- 삭제모달 -->
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">삭제 확인</h4>
				</div>
				<div class="modal-body form-inline">
					<input type="hidden" id="delnum"> <b>삭제 비밀번호: </b> <input
						type="password" id="delpass" class="form-control"
						style="width: 120px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default delbtn"
						data-dismiss="modal">삭제</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 자바 스크립트로 처리 -->

	<script type="text/javascript">

function delfunc(num){
	
	$("#delnum").val(num);
	$("#myModal").modal();
	
	//모달삭제버튼 이벤트
	$("button.delbtn").click(function(){
		
		//num,pass읽기
		var num = $("#delnum").val();
		var pass = $("#delpass").val();
		
		//delete파일 호출
		location.href="gaip/gaipdelete.jsp?num="+num+"&pass="+pass;
		
	});
	
}

</script>
</body>
</html>