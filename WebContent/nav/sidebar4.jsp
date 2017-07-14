<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
.col-sm-2{
	padding-left: 130px;
	padding-top: 60px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
	
	<div class="col-sm-2">
	<h3><font color="#949494" size="5" face="맑은 고딕">커뮤니티</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${ContextPath}/controller/AllBoardListServlet.do"><font color="#8C8C8C">기부동향</font></a></li>
			 
 			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#8C8C8C">고객센터</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/QuestionFaqServlet.do">자주하는 질문</a></li>
					<li><a href="${ContextPath}/controller/QuestionWriteServlet.do">1:1 문의</a></li>
			  </ul>
			  </li>
			  
			  <li><a href="${ContextPath}/controller/AllBoardDonationSearchServlet.do"><font color="#8C8C8C">기부처검색</font></a></li>
		</ul>
		</div>
</body>
</html>