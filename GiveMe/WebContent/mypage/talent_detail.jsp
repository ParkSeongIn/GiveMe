<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현금후원내역(마이페이지)</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar5.jsp"/>
	
	<div class="container">
	<div class="col-sm-10">	
	<br>
	<h2>재능후원 내역</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-hover" id="qna_board_list">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">번호</th>
				<th width="10%">분야1</th>
				<th width="10%">분야2</th>
				<th width="10%">희망자 이름</th>
				<th width="10%">제공날짜</th>
				<th width="10%">기부상태</th>
				<th width="10%">제공취소</th>
			</tr>
		</thead>
		 <tbody>
		 		<tr>
		 			<td>1</td>
					<td>언어</td>
					<td>영어</td>
					<td>홍길동</td>
					<td>2017년7월10일</td>
					<td>완료</td>
					<td></td>
				</tr>	
		</tbody>
	</table>
	</div>
	
	<div class="col-sm-10">	
	<br>
	<h2>재능신청 내역</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-hover" id="qna_board_list">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">번호</th>
				<th width="10%">분야1</th>
				<th width="10%">분야2</th>
				<th width="10%">후원자 이름</th>
				<th width="10%">받은 날짜</th>
				<th width="10%">기부상태</th>
				<th width="10%">제공취소</th>
			</tr>
		</thead>
		 <tbody>
		 		<tr>
		 			<td>1</td>
					<td>언어</td>
					<td>영어</td>
					<td>홍길동</td>
					<td>2017년7월10일</td>
					<td>대기</td>
					<td></td>
				</tr>	
		</tbody>
	</table>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>