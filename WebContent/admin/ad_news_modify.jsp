<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.admin.AdminServiceImpl" %>
<%@ page import = "service.allboard.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부동향 수정 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $('#ModifyButton').click(function(){ 
        if($('#abtitle').val().length <1) { 
            alert('제목을 입력하세요');
            $('#abtitle').focus(); 
        } else if($('#abcontent').val()=='') { 
            alert('내용을 입력하세요');
            $('#abcontent').focus();
        } else {
            $('#ModifyForm').submit();
        }
    });
});


function get_image(){
	var file = $("#image_file")[0].files[0];
	var reader = new FileReader();
	reader.onloadend = function(){
		$("#preview").attr("src", reader.result);
	};
	reader.readAsDataURL(file);
}
	
</script>
<style>
img {
	width:300px;
	position:absolute;
}
form {
	width:700px;
	float:right;
}
.form-group1, .form-group2{
	width:300px;
}
.bottom{
	margin-top:30px;
	float:right;
}
.form-group3{
margin-top:20px;
}

</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
<%
AllBoardVo ab = (AllBoardVo)request.getAttribute("ab");
int abidx = (Integer)request.getAttribute("abidx");
%>
	<h1>기부처 리스트 수정</h1>
	
	<div class="image">
		<c:url var="path" value="/upload"/>
		<img src="${path }/${ab.abimage }">
	</div>
	<form id="ModifyForm"  name="modyForm" action="${ContextPath }/controller/AllBoardModifyActionServlet.do" enctype="multipart/form-data" method="post">
    <div class="form-group1">
		<label for="abidx">글번호 : ${abidx} </label>
		<input class="form-control" name="abidx" id="abidx" type="hidden" value="${abidx}"/>
    </div>
	 <div class="form-group1">
        <label for="abtitle">제목 :</label>
        <input class="form-control" name="abtitle" id="abtitle" type="text" value="${ab.abtitle}"/>
     </div>
	        
   	 <div class="form-group2">
    	<label for="abcontent">내용 :</label>
        <input class="form-control" name="abcontent" id="abcontent" type="text" value="${ab.abcontent}"/>
     </div>    
        
     <div class="form-group4" >
		<label class="control-label" for="image_file">이미지첨부</label>
		<input type="file" id="image_file" name="image_file" class="form-control" accept="image/*" onchange="get_image()" />
	</div>	
					
    <div>
       <input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
       <input class="btn btn-default" type="reset" value="초기화"/>
       <a class="btn btn-default" href="${ContextPath }/controller/AllBoardContentServlet.do?abidx=${abidx}">목록</a>
    </div>
       </form> 
 </div>    
</body>
</html>