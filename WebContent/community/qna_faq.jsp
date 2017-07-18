<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<%@ page import ="service.member.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	*{
		font-family: "Noto Sans KR","Nanum Brush Script";
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>QNA 게시판</title>
<style>
.faq dd{display:none;}

.form-group{
	padding-top: 30px;
}
dl{
	font-size: 20px;
}
div.faq{
	padding-left: 180px;
}
div.col-sm-4{
	padding-left: 130px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar4.jsp"/>
<div class="container">
		<div class="form-group">
				<div class="faq">
					<font size="5" face="맑은 고딕">FAQ</font>
					<hr color="#D5D5D5" width="40%" align="left">
					<dl  class="faq">
					<dt><a href="#" onclick="evt('sub1')">질문1</a></dt>
					<dd id="sub1">답변1<dd>
					<dt><a href="#" onclick="evt('sub2')">질문2</a></dt>
					<dd id="sub2">답변2<dd>
					<dt><a href="#" onclick="evt('sub3')">질문3</a></dt>
					<dd id="sub3">답변3<dd>
					<dt><a href="#" onclick="evt('sub4')">질문4</a></dt>
					<dd id="sub4">답변4<dd>
					</dl>
				</div>
				<div class="col-sm-4">
					<ul class="pagination pagination-sm">
					  <li><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					</ul>
				</div>
		</div>
	</div>	
<c:import url="/nav/footer.jsp"/>
<script>
	function evt(newwin){
	var objid=document.getElementById(newwin);
	if(objid.style.display=="block")
	{
	objid.style.display="none";
	}
	else{
	objid.style.display="block";
	}
	}
</script>
</body>
</html>