<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지 사이드바</title>
<link rel="stylesheet" href="../css/sidebar.css" type="text/css">
</head>
<body>
		<div class="side3">
		<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
				<h2><소개></h2>
			<nav class="lnb">
				<ul>
					<li class="m" ><a href="${ContextPath}/controller/MemberListServlet.do">회원관리</a></li>
					<li class="i"><a href="${ContextPath}/controller/DonationListServlet.do">기부처관리</a></li>
					<li class="h"><a href="#">기부정보 관리</a></li>
					<li class="h"><a href="#">게시판 관리</a></li>
					<li class="h"><a href="#">1:1문의 관리</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>