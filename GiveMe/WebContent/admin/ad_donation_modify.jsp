<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="service.admin.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부처리스트 작성</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
        $('#modyButton').click(function(){
            if($('#dlplace').val().length <1) {
                alert('기부처는 1자이상 이어야 합니다');
                $('#dlplace').focus();
            } else if($('#dlarea').val()=='') {
                alert('지역을 입력하세요');
                $('#dlarea').focus();
            } else if($('#dlcontent').val()=='') {
                alert('내용을 입력하세요');
                $('#dlcontent').focus();
            }  else {
                $('#modyForm').submit();
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

select{
	width :200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
select::-ms-expand { /* for IE 11 */
    display: none;
}

</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
<%
DonationListVo dl = (DonationListVo)request.getAttribute("dl");
int dlidx = (Integer)request.getAttribute("dlidx");
%>
	<h1>기부처 리스트 수정</h1>
	
	<div class="image">
		<c:url var="path" value="/upload"/>
		<img src="${path }/${dl.dlimage }">
	</div>
	<form id="modyForm"  name="modyForm" action="${ContextPath }/controller/DonationModifyActionServlet.do" enctype="multipart/form-data" method="post">
	<input type="hidden" name="dlidx" value="${dl.dlidx}"/>
	 <div class="form-group1">
            <label for="dlplace">기부처 :</label>
            <input class="form-control" name="dlplace" id="dlplace" type="text" value="${dl.dlplace}"/>
        </div><br/>
	        
        <div class="form-group2">
            <label for="dlarea">지역 :</label>
            <input class="form-control" name="dlarea" id="dlarea" type="text" value="${dl.dlarea }"/>
        </div><br/>
        
        	<select id="dlgroup1" name="dlgroup1" >
	    		<option value="1">개인</option>
			</select>
		
			<select id="dlgroup2" name="dlgroup2"  >
	    		<option value="독거노인">독거노인</option>
	    		<option value="저소득">저소득</option>
	    		<option value="한부모">한부모</option>
			</select>
        
        <div class="form-group3">
        	<label for="dlcontent">내용 :</label>
        	<textarea name="dlcontent" id="dlcontent" rows="10" cols="100" >${dl.dlcontent}</textarea>
        </div>
        <br/>
        
        <div class="form-group4" >
			<label class="control-label" for="image_file">이미지첨부</label>
				<input type="file" id="image_file" name="image_file" class="form-control" accept="image/*" onchange="get_image()" />
				
		</div>	
					
        <div class="bottom">
            <input class="btn btn-default" id="modyButton" type="button" value="수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${ContextPath }/controller/DonationContentServlet.do?dlidx=${dl.dlidx }">취소</a>
        </div>
       </form> 
 </div>    
</body>
</html>