<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사업안내</title>
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
    height: 400px;
    margin-top:30px;
    padding-left: 0px;
    padding-right: 0px;
}
div.col-sm-2{
    width: 174px;
}
div.col-sm-7{
	border: 1px solid #EFEFEF;
    width: 850px;
    height: 400px;
    margin-top:30px;
    padding-left: 0px;
    padding-right: 0px;
}
</style>
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar1.jsp"/>
<div class="container">
	<div><font size="40px;">사업안내</font></div>
	도움이 필요한 곳이라면 어디든 달려가겠습니다.
	<div class="col-sm-8">
	<font size="20px;">2017 현금후원현항</font>
	</div>
	<div class="col-sm-2"></div>
	<div class="col-sm-7">
	<font size="20px;">2017 재능후원현항</font>
	</div>
</div>

</body>
<c:import url="/nav/footer.jsp"/>
</html>