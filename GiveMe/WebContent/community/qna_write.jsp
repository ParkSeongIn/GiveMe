<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	*{
		font-family: "Noto Sans KR","Nanum Brush Script";
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA Write</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $('#addButton').click(function(){
            if($('#qtitle').val()=='') {
                alert('입력하세요');
                $('#qtitle').focus();
            }else if($('#qcontent').val()=='') {
                alert('입력하세요');
                $('#qcontent').focus();
            }else {
                $('#addForm').submit();
            }
        });
    });
</script>
</head>
<body>
<div style="width:800px;margin:0 auto;margin-top:100px;">
<h1>1:1문의 Write</h1>
	 <form id="addForm" action="<%=request.getContextPath()%>/controller/question/QuestionWriteActionServlet.do" method="post">
	<p>유형 : <select name="qcategory">
			  <option value="LOG" selected="selected">회원가입</option>
			  <option value="CG">현금기부</option>
			  <option value="TG">재능기부</option>
			  <option value="AQ">결제</option>
			  <option value="OTHER">기타</option>
			</select></p>
	<div class="form-group">
            <label for="qtitle">제목 :</label>
            <input class="form-control" name="qtitle" id="qtitle" type="text" autocomplete="off"/>
    </div>
    <div class="form-group">
            <label for="qcontent">내용 :</label>
            <textarea class="form-control" name="qcontent" id="qcontent" rows="5" cols="50" autocomplete="off"></textarea>
    </div>
    <div>
         	<input class="btn btn-default" id="addButton" type="button" value="등록"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">취소</a>
        </div>
    </form>
</div>
</body>
</html>