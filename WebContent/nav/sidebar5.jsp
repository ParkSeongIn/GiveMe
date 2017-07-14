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
.col-sm-2{
	padding-left: 130px;
	padding-top: 60px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
	
	<div class="col-sm-2">
	<h3><font color="#949494" size="5" face="맑은 고딕">마이페이지</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#8C8C8C">내정보관리</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="#">개인정보변경</a></li>
					<li><a href="#">회원탈퇴</a></li>
			  </ul>
			  </li>

			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#8C8C8C">후원내역</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/MypageCashDonationListServlet.do">현금후원</a></li>
					<li><a href="${ContextPath}/controller/TalentBoardMyListServlet.do">재능후원</a></li>
			  </ul>
			  
			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#8C8C8C">1:1문의 상담 내역</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/MypageQuestionListServlet.do">1:1문의 상담 목록</a></li>
			  </ul>
			  </li>
		</ul>
		</div>
</body>
</html>