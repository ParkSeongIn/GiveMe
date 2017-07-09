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
<c:import url="/nav/sidebar1.jsp"/>
	
	<div class="container">
	<div class="col-sm-10">	
	<br>
	<h2>공지사항</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-striped table-bordered table-hover" id="notic_board_list">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">글 번호</th>
				<th width="20%">글제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="20%">작성날짜</th>
			</tr>
		</thead>
		 <tbody>
		 		<tr>
		 			<td>1</td>
					<td>첫글입니다</td>
					<td>admin</td>
					<td>1</td>
					<td>2017.7.9</td>
				</tr>	
		</tbody>
	</table>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>