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
<body>
	<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
	<br>
	<div class="col-sm-3">
		<h3><font color="#949494" size="5" face="맑은 고딕">사업내용</font></h3>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${ContextPath}/controller/BusinessCashDonation.do" target="_self"><font color="#8C8C8C">현금기부</font></a></li>
			  <li><a href="${ContextPath}/controller/BusinessTalentDonation.do" target="_self"><font color="#8C8C8C">재능기부</font></a></li>
		</ul>
		</div>
</body>
</html>