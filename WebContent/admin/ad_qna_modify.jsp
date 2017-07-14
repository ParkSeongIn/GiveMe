<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.admin.*" %>
<%@ page import ="service.question.*" %>
<%@ page import ="service.member.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
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
<style>
div.col-sm-10{
  padding-top: 60px;
  padding-left: 80px;
}
div.qna-modify{
	width: 210px;
	height: 100px;
	float: right;
	margin-top: 35px;
	margin-right: 319px;
}
div.form-group1{
	margin-top: 35px;
}
div.font{
	font-weight: bold;
}
div.category{
	margin-bottom: 10px;
}
div.other{
	float: right;
	margin-bottom: 10px;
}
div.qtitle{
	border: 1px solid #bbb;
	padding: 5px;
	margin-bottom: 20px;
	border-radius: 10px 10px 10px 10px;
}
div.qcontent{
	border: 1px solid #bbb;
	padding: 5px;
	margin-bottom: 20px;
	border-radius: 10px 10px 10px 10px;
}
div.qrecontent{
	border: 1px solid #bbb;
	padding: 5px;
	border-radius: 10px 10px 10px 10px;
}
textarea:focus{    
	outline: none; 
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar4.jsp"/>
<div class="container">
	<div class="panel-body">
		<div class="col-sm-10">
			<h1>1:1문의 답변수정</h1>
			<div class="form-group1">
					<form id="ModifyForm" action="<%=request.getContextPath()%>/controller/AdQuestionModifyActionServlet.do" method="post">
						<div class="category">
							카테고리 : <%=qv.getQcategory() %>
		  				</div>		
		  				<div class="other">
							작성자 : 작성자
							작성날짜 : <%=qv.getQwdate() %>
		  				</div>	
						<div class="font">
							제목 :
						</div> 
						<div class="qtitle">
							<%=qv.getQtitle() %>
						</div>
						<div class="font">
							내용 :
						</div>	 	
						<div class="qcontent">
							<%=qv.getQcontent() %>
						</div>
						<div class="font">
							답변 : 	
						</div>
						<div class="qrecontent">
							<textarea name="qrecontent" id="qrecontent" rows="10" cols="100" style="width:100%; border: 0; resize: none;"><%=((qv.getQrecontent()+" ").replace("null", ""))%></textarea>
						</div>
						<div class="qna-modify">
						  	<input class="btn btn-default" id="qidx" name="qidx" type="hidden" value="<%=qv.getQidx() %>"/>
				        	<input class="btn btn-default" id="ModifyButton" type="button" value="답변 작성"/>
				        	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AdQuestionContentServlet.do?qidx=<%=qv.getQidx() %>">취소</a>
        				</div>
        			</form>
				</div>
		</div>
	</div>
</div>
</body>
</html>