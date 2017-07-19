<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>재능후원</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<style>
div.col-sm-8{
	border: 1px solid #EFEFEF;
    width: 850px;
    height: 230px;
    margin-top:30px;
    padding-left: 0px;
    padding-right: 0px;
}
img{
	 width: 440px;
	 float: right;
}
div.col-sm-5{
	 padding-top: 45px;
	 padding-left: 65px;
}
div.col-sm-2{
    width: 13.666667%;
}
.talent{
	font-size:30px;
}
</style>
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar2.jsp"/>
<div class="container">
	<h2>재능후원</h2>
	<div class="col-sm-8">
			<div class="col-sm-5">
			<font class="talent">재능후원</font><span>은 </span>
			</div>
			<img src="../image/talent.jpg" alt="재능후원">
	</div>
	<div class="col-sm-2"></div>
	<div class="col-sm-7">
	<h3>재능후원, 이렇게 진행됩니다.</h3>
	<hr color="#D5D5D5" width="40%" align="left">
	</div>
</div>

</body>
</html>