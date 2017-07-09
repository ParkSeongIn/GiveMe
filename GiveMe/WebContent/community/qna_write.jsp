<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>QNA 게시판</title>
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
<style>
.wrap{
	height: 800px;
}
.form-group1{
	width: 800px;
	height: 300px;
    float: right;
    margin-right: 210px;
}
.form-group2{
	width: 800px;
	height: 300px;
    float: right;
    margin-right: 210px;
}
</style>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<div class="wrap">
	<div class="panel-body">
		<div class="form-group1">
				<div class="faq">
					<font size="5" face="맑은 고딕">FAQ</font>
				</div>
		</div>
		
		<div class="form-group2">
	<font size="5">1:1문의 Write</font>
	 <form id="addForm" action="<%=request.getContextPath()%>/controller/QuestionWriteActionServlet.do" method="post">
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
             <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionListServlet.do">1:1문의 내 글 목록</a>
        </div>
    </form>
</div>
		</div>	
	</div>
	
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>