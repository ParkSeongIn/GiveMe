<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<%@ page import ="service.member.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
//	int qidx = Integer.parseInt(request.getParameter("qidx"));
//	MemberVo vo = (MemberVo)session.getAttribute("vo");
//	String mid = vo.getMid();
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
        $('#ModifyButton').click(function(){		//#=id		addButton=insert할때
            if($('#qtitle').val().length <1) {
                alert('제목은 1자이상 이어야 합니다');
                $('#qtitle').focus();
            } else if($('#qcontent').val()=='') {
                alert('내용을 입력하세요');
                $('#qcontent').focus();
            } else {
                $('#ModifyForm').submit();			//#addForm = form 아이디
            }
        });
    });
</script>
<title>QNA Modify</title>
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
			<h1>1:1문의 상세내용 수정</h1>
			<table class="table table-bordered" style="width:800px;margin:0 auto;text-align:center;margin-top:100px;">
				<tr>
					<td style="width:20%">회원번호</td>
					<td style="width:40%">글 유형</td>
					<td style="width:40%">작성자</td>
					<td style="width:40%">날짜</td>
				</tr>
				<tr>
					<td><%=qv.getMidx() %></td>
					<td><%=qv.getQcategory() %></td>
					<td>작성자</td>
					<td><%=qv.getQwdate() %></td>
				</tr>
			</table>
			<div class="form-group1">
				<form id="ModifyForm" action="<%=request.getContextPath()%>/controller/QuestionModifyActionServlet.do" method="post">
			       	<div class="form-group">
			            <label for="qtitle">제목 :</label>
			       		<input class="form-control" name="qtitle" id="qtitle" type="text" value="<%=qv.getQtitle() %>" autocomplete="off"/>
			       	</div>
			       	<div class="form-group">
          			 	<label for="qcontent">내용 :</label>
            			<textarea class="form-control" name="qcontent" id="qcontent" rows="5" cols="50" autocomplete="off"><%=qv.getQcontent() %></textarea>
       				</div>
			</div>
		</div>
	</div>
</div>
		  <div class="qna-modify">
		  <input class="btn btn-default" id="qidx" name="qidx" type="hidden" value="<%=qv.getQidx() %>"/>
        	<input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
        	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionContentServlet.do?qidx=<%=qv.getQidx() %>">취소</a>
        </div>
</body>
</html>