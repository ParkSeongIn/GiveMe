<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import ="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.cashdonation.*" %>
<%@ page import = "service.member.*" %>
<%
CashDonationVo cv = (CashDonationVo)request.getAttribute("cv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>영수증</title>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<div class="container">
	<div class="panel panel-default">
	<h1>영수증</h1>
	<hr color="#D5D5D5" width="40%" align="left">
	<div class="panel-body">
		<div class="form-group">
		<h2>후원자</h2>
		<label class="control-label" for="cname">이름:${sessionScope.vo.mname}</label><br/>
		<label class="control-label" for="caddr">주소:${sessionScope.vo.maddr1} &nbsp;${sessionScope.vo.maddr2}</label><br/>
		<label class="control-label" for="cbirth">생년월일:${sessionScope.vo.mbirth}</label>
		</div>
		<div class="form-group">
		<h2>상세내역</h2>
		<label class="control-label" for="cgroup1">분야1:</label>${cv.cway}<br/>
		<label class="control-label" for="cgroup2">분야2:</label><br/>
		<label class="control-label" for="cplace">후원처명:</label>
		</div>
		<div class="form-group">
		
		<label class="control-label" for="cmoney">후원금액:</label>${cv.cmoney}<br/>
		<label class="control-label" for="cpaydate2">후원날짜:</label>${cv.cpaydate2}<br/>
		</div>
		<hr color="#D5D5D5" width="100%" align="left">
		<a type="button" href="#" class="btn btn-defualt">확인</a>
		<a href="#" class="btn btn-defualt">출력</a>
	</div>
	</div>
</div>
</body>
</html>