<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능기부 게시판 인덱스</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.container{
	padding-top:100px;
}
div.col-sm-10 {
      padding-left: 315px;
}
button.btn.btn-default{
	font-size:70px;
	margin-left:10px;
	
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
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
	
	<div class="container">
	  <div class="col-sm-10">
		<button class="btn btn-default" style="padding-right:80px;"><a href="${ContextPath}/controller/TalentBoardListServlet.do">언어</a></button>
		<button class="btn btn-default">컴퓨터</button><br/><br/><br/>
		<button class="btn btn-default" style="padding-right:80px;">음악</button>
		<button class="btn btn-default">디자인</button><br/><br/><br/>
		<button class="btn btn-default">수공예</button>
		<button class="btn btn-default" style="padding-right:80px;">기타</button>
	  </div>	
	</div>
	<br/>
<c:import url="/nav/footer.jsp"/>
</body>
</html>