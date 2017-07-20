<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.col-sm-3{
	padding-left: 120px;
	padding-top: 60px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
	
	<div class="col-sm-3">
	<h3><font color="#000000" size="4" face="맑은 고딕">관리자페이지</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${ContextPath}/controller/MemberListServlet.do"><font color="#000000">회원관리</font></a></li>
			  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			  <font color="#000000">후원정보 관리</font>
			  </a>
			  <ul class="dropdown-menu"> 
					<li><a href="${ContextPath}/controller/CashDonationListServlet.do">현금후원</a></li>
					<li><a href="${ContextPath}/controller/TalentBoardAdListServlet.do">재능후원</a></li>
			  </ul>
			  </li>
			  <li><a href="${ContextPath}/controller/DonationListServlet.do"><font color="#000000">기부처관리</font></a></li>
			  <li><a href="#"><font color="#000000">게시판관리</font></a></li>
			   <li><a href="${ContextPath}/controller/AdQuestionListServlet.do" ><font color="#000000">1:1 문의 관리</font></a></li>
		</ul>
		</div>
</body>
</html>