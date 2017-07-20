<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.col-sm-3{
	padding-left: 130px;
	padding-top: 60px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
	
	<div class="col-sm-3">
	<h3><font color="#000000" size="5" face="맑은 고딕">커뮤니티</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${ContextPath}/controller/AllBoardListServlet.do"><font color="#000000">기부동향</font></a></li>
			 
 			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#000000">고객센터</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/QuestionFaqServlet.do">자주하는 질문</a></li>
					<li><a href="${ContextPath}/controller/QuestionWriteServlet.do">1:1 문의</a></li>
			  </ul>
			  </li>
			  
			  <li><a href="${ContextPath}/controller/AllBoardDonationSearchServlet.do"><font color="#000000">기부처검색</font></a></li>
		</ul>
		</div>
</body>
</html>