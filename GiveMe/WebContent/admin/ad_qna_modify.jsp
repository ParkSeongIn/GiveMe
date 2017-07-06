<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.admin.*" %>
<%@ page import ="service.question.*" %>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
        $('#ModifyButton').click(function(){		
            if($('#qrecontent').val().length <1) {
                alert('답변은 1자이상 이어야 합니다');
                $('#qrecontent').focus();
            }else {
                $('#ModifyForm').submit();			
            }
        });
    });
</script>
<title>Admin QNA 답변 작성, 수정</title>
</head>
<body>
<div class="container">
	<div class="form-group">
		<h1>1:1문의 답변 작성, 수정</h1>
	</div>
	<form id="ModifyForm" action="<%=request.getContextPath()%>/controller/admin/AdQuestionModifyActionServlet.do" method="post">
		<div class="form-group">
    	<label for="qidx">qidx :</label>
		<input class="form-control" name="qidx" id="qidx" type="text" value="<%=qv.getQidx() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
    	<label for="qtitle">제목 :</label>
		<input class="form-control" name="qtitle" id="qtitle" type="text" value="<%=qv.getQtitle() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="midx">회원번호 :</label>
	    <input class="form-control" name="midx" id="midx" type="text" value="<%=qv.getMidx() %>" readonly="readonly""/>
	</div>
 	<div class="form-group">
    	<label for="qcategory">유형 :</label>
		<input class="form-control" name="qcategory" id="qcategory" type="text" value="<%=qv.getQcategory() %>" readonly="readonly"/>
	</div> 
	<!-- 작성자 -->
	<div class="form-group">
	    <label for="qwdate">작성날짜 :</label>
	    <input class="form-control" name="qwdate" id="qwdate" type="text" value="<%=qv.getQwdate() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="qcontent">내용 :</label>
	    <input class="form-control" name="qcontent" id="qcontent" type="text" value="<%=qv.getQcontent() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="qrecontent">답변 :</label>
	    <input class="form-control" name="qrecontent" id="qrecontent" type="text" value="<%=qv.getQrecontent() %>"/>
	 </div>
   		<div>
       	<input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
       	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/admin/AdQuestionContentServlet.do">취소</a>
       </div>
</body>
</html>