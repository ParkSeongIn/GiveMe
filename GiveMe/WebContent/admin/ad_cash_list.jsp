<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>현금후원내역(관리자)</title>
<style>
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar6.jsp"/>
	
	<div class="container">
	<div class="col-sm-10">	
	<br>
	<h2>현금기부 내역</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-hover" id="ad_cash_list">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">회원번호</th>
				<th width="10%">후원자명</th>
				<th width="10%">기부방법</th>
				<th width="10%">기부처</th>
				<th width="10%">금액</th>
				<th width="10%">날짜</th>
				<th width="10%">상태</th>
				<th width="20%">(정기)후원취소</th>
			</tr>
		</thead>
		 <tbody>
		 		<tr>
		 			<td>1</td>
					<td>홍길동</td>
					<td>정기</td>
					<td>OO복지관</td>
					<td>30000</td>
					<td>2017.7.9</td>
					<td></td>
					<td></td>
				</tr>	
		</tbody>
	</table>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>