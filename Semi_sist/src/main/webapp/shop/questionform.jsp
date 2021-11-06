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
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<style type="text/css">
body{
background-color: #F5F5F8;

}

.title, .subtitle{
	text-align: center;
	padding-bottom: 30px;

}
.subtitle{
	color: #708090;
	line-height: 30px;
}

</style>
<script type="text/javascript">


</script>
<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="../assets/logo1.ico" />
</head>
<body>

        <article class="container" style="background-color: #f5f5f5; font-family: 'Montserrat', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';">
            <div class="page-header" >
                <div class="col-md-6 col-md-offset-3">
                <h2 class="title"><b>입점 문의</b></h2>
                <h4 class="subtitle" >지금 바로, 부담 없이 무료 상담 받아보세요!<br>
					아래 내용을 상세하게 적을수록 빠르고 정확한 상담이 가능합니다.</h4>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
            <!-- action으로 보낼 폼 -->
                <form action="shop/questionaction.jsp" method="post" enctype="multipart/form-data" >
                <!-- 매장명 -->
                    <div class="form-group">
                        <label for="inputName">매장명&nbsp;&nbsp;<font color="red">*</font></label>
                        <input type="text" class="form-control" name="name" placeholder="매장명을 입력해 주세요" required="required">
                    </div>
                    <!-- 매장번호 -->
                    <div class="form-group">
                        <label for="InputEmail">매장 전화번호&nbsp;&nbsp;</label>
                        <input type="tel" class="form-control" name="telephone" placeholder="전화번호를 입력해주세요">
                    </div>
                    <!-- 음식 종류 -->
                    <div class="form-group">
                        <label for="inputPassword">판매 음식 종류&nbsp;&nbsp;<font color="red">*</font></label>
                        <input type="text" class="form-control" name="tag" placeholder="음식종류를 입력해주세요" required="required">
                    </div>
                    <!-- 매장 주소 -->
                    <div class="form-group">
                        <label for="inputPasswordCheck">매장 주소&nbsp;&nbsp;<font color="red">*</font></label>
                        <input type="text" class="form-control" name="addr" placeholder="매장주소를 입력해주세요" required="required">
                    </div>
                    
                    <!-- 매장 소개글 -->
                    <div class="form-group" >
                        <label for="inputPasswordCheck">매장 소개글&nbsp;&nbsp;<font color="red">*</font></label>
                        <textarea style="width: 540px; height: 100px;" class="form-control" name="introduce" id="introduce"
                        placeholder="소개글을 입력해주세요 (80자 이하)"></textarea>
                    </div>
                    
                    
                    <!-- 매장 사진 -->
                    <div class="form-group" >
                        <label >매장사진</label>
                       <input type="file" name="photo">    
                    </div>
                    
                    <!-- 영업시간 -->
                    <div class="form-group">
                        <label>영업 시간&nbsp;&nbsp;<font color="red">*</font></label><br>
                        <select id="open" name="opening" style="width: 100px; float: left;">
                        <%
                        for(int i=0; i<=24; i++){%>
                        	<option value="<%=i%>"><%=i %>:00</option>
                        <%}
                        %>
             			
            			</select>
            			<b style="float: left;">&nbsp;&nbsp;~&nbsp;&nbsp;</b>
            			<select id="close" name="closing" style="width: 100px; float: left;">
             				<%
                        for(int i=0; i<=24; i++){%>
                        	<option value="<%=i%>"><%=i %>:00</option>
                        <%}
                        %>
            			</select>
            			
            			
            			
                    </div>
                    <!-- 휴식시간 -->
                    <div class="form-group" style="clear: both; padding-top: 15px;">
                        <label>휴식 시간&nbsp;&nbsp;<font color="red">*</font></label><br>
                        <select id="open" name="reststart" style="width: 100px; float: left;">
                        <%
                        for(int i=0; i<=24; i++){%>
                        	<option value="<%=i%>"><%=i %>:00</option>
                        <%}
                        %>
             			
            			</select>
            			<b style="float: left;">&nbsp;&nbsp;~&nbsp;&nbsp;</b>
            			<select id="close" name="restend" style="width: 100px; float: left;">
             				<%
                        for(int i=0; i<=24; i++){%>
                        	<option value="<%=i%>"><%=i %>:00</option>
                        <%}
                        %>
            			</select>
            			
            			
            			
                    </div>
                    <br><br>
                    
                    
                    
                                        
                    <!-- 좌석수 -->
                    <div class="form-group"  style="clear: both;">
                        <label for="inputPasswordCheck" >매장 좌석 수&nbsp;&nbsp;<font color="red">*</font></label><br>
                        <label style="float: left; color: gray">룸&nbsp;&nbsp;</label>
                   
                        <input type="text" name="room" style="float: left; width: 50px; height: 20px;">&nbsp;좌석
                        <div style="clear: both;"></div>
                        <label style="float: left; color: gray">홀&nbsp;&nbsp;</label>
                        <input type="text" name="hall" style="float: left; width: 50px; height: 20px;">&nbsp;좌석
                    </div>
					<br> 
					<!-- 주차공간 -->
					 <div class="form-group"  style="clear: both;">
                        <label for="inputPassword">주차 공간 유무</label>&nbsp;&nbsp;
                        <input type="checkbox"  name="parking" class="custom-control-input" >
                    </div>
                    
                
					 <!-- 메뉴+가격 -->
					<div class="form-group" style="clear: both;">
                        <label for="inputPasswordCheck">메뉴</label>
                        <label for="inputPasswordCheck" style="margin-left: 150px;">가격</label>
                        <div style="clear: both;"></div>
                        <input type="text" class="form-control" name="menu" placeholder="메뉴 입력" 
                        style="width: 150px; float: left;">
                       
                        <input type="text" class="form-control" name="price" placeholder="가격 입력" 
                        style="width: 150px; float: left; margin-left: 30px;">
                        <div style="clear: both;"></div>
                        <br>
                        <div id="menuDiv" style="clear: both;"></div>
                        
                        
                       
                    </div>
                    
 					<button type="button" id="btnAdd">+</button>
					
					
                   <br> <br> <br> 

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" style="width: 220px; height: 60px; background-color: rgb(254,225,14); color: rgb(108,117,126); border: none; box-shadow: 0.5px 0.5px 0.5px 0.5px; border-radius: 10px; font-size: 21px; font-weight: bold; padding-left: 17px;">
                            접수하기<i class="fa fa-check spaceLeft" style="margin-left: 10px; color: rgb(108,117,126); font-size: 19px; font-weight: bold;"></i>
                        </button>
                        
                    </div>
                </form>
            </div>

        </article>
 					<script type="text/javascript">
                    
                    $("#btnAdd").click(function(){
                    	
                    	$("#menuDiv").append("<input type='text' class='form-control' name='menu' style='width: 150px; float: left; margin-bottom: 20px;' placeholder='메뉴 입력'>")
                    	$("#menuDiv").append("<input type='text' class='form-control' name='price' style='width: 150px; float: left; margin-left: 30px; margin-bottom: 20px;' placeholder='가격 입력'>")
						$("#menuDiv").append("<div style='clear: both;'></div>")
                        		
                    });
                    
                    $(document).ready(function() {


                        $('#introduce').on('keyup', function() {


                            if($(this).val().length > 80) {
                                $(this).val($(this).val().substring(0, 80));
                               
                            }


                        });


                    });
                    
                    
                    </script>
    </body>
</html>

