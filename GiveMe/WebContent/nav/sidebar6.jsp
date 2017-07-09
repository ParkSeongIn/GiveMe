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
	<h3><font color="#949494" size="4" face="맑은 고딕">관리자페이지</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${ContextPath}/controller/MemberListServlet.do"><font color="#8C8C8C">회원관리</font></a></li>
			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#8C8C8C">후원정보 관리</font>
			  </a>
			  <ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/CashDonationListServlet.do">현금후원</a></li>
					<li><a href="${ContextPath}/controller/TalentBoardAdListServlet.do">재능후원</a></li>
			  </ul>
			  </li>
			  <li><a href="${ContextPath}/controller/DonationListServlet.do"><font color="#8C8C8C">기부처관리</font></a></li>
			  <li><a href="#"><font color="#8C8C8C">게시판관리</font></a></li>
			  <li><a href="#" ><font color="#8C8C8C">1:1 문의 관리</font></a></li>
		</ul>
		</div>
</body>
</html>