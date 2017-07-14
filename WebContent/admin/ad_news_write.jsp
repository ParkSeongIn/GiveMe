<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.allboard.AllBoardVo" %>
<%
ArrayList<AllBoardVo> ablist = (ArrayList<AllBoardVo>)request.getAttribute("ablist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('#addButton').click(function(){
            if($('#abtype').val().length <1) { 
                alert('타입을 입력하세요');
                $('#abtype').focus();
            } else if($('#abtitle').val()=='') {
                alert('제목을 입력하세요');
                $('#abtitle').focus();
            } else if($('#abcontent').val()=='') {
                alert('내용을 입력하세요');
                $('#abcontent').focus();
            } else {
                $('#addForm').submit();
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
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
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
<title>기부동향</title>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp" />
<c:import url="/nav/sidebar4.jsp" />
<div class="container">
	<div class="col-sm-4">
    <h2>기부동향 게시판 글쓰기</h2>
    	<img id="preview"  src="http://placehold.it/300x300?text=preview"/>
    </div>
    <div class="col-sm-6">
    <form id="addForm" enctype="multipart/form-data" action="${ContextPath }/controller/AllBoardWriteActionServlet.do" method="post" >
        <div class="form-group">
  			<label for="abid">작성자 : </label>
  			<input type="text" name="abid" id="abid" class="form-control" value="${sessionScope.vo.mid }" readonly="readonly" style="width:100px;"/>
  			
  		</div>
            	<input class="form-control" name="abtype" id="abtype" type="hidden" value="N" readonly="readonly"/>
        
		<div class="form-group">
            <label for="abtitle">제목 :</label>
            <input class="form-control" name="abtitle" id="abtitle" type="text"/>
        </div>
       	<div class="form-group">
            <label for="abcontent">내용 :</label>
            <textarea name="abcontent" id="abcontent" rows="10" cols="75"></textarea>
        </div>
        <br/>
        <div class="form-group" >
			<label class="control-label" for="image_file">이미지첨부</label>
				<input type="file" id="image_file" name="image_file" class="form-control" accept="image/*" onchange="get_image()"/>	
		</div>
		<div class="col-sm-6"></div>
        <div class="col-sm-6">
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">글목록</a>
        </div>
    </form>
	</div>
</div>
</body>
</html>