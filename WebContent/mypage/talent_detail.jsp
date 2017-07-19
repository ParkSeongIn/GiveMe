<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="service.talentboard.*" %>
<%
int tbidx=(Integer)request.getAttribute("tbidx");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능후원내역(마이페이지)</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
	<span style="font-size:40px;">재능후원 내역</span>
	<a href="#" class="btn btn-default">재능후원 설명</a>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-hover" id="tblist">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">번호</th>
				<th width="10%">글번호</th>
				<th width="10%">분야1</th>
				<th width="10%">분야2</th>
				<th width="10%">후원자 이름</th>
				<th width="10%">제공날짜</th>
				<th width="10%">기부상태</th>
				<th width="10%">제공취소</th>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="tb" items="${tblist}">
		 		<tr>
			 		<td>${tb.midx}</td>
			 		<td>${tb.tbidx}</td>
					<td>${tb.tbcategory1}</td>
					<td>${tb.tbcategory2}</td>
					<td>${tb.mid}</td>
					<td>${tb.tbhdate}</td>
					<td>${tb.tbstate}</td>
					<td><a href="${ContextPath}/controller/TalentBoardDeleteCancleServlet.do?tbidx=${tb.tbidx}" class="btn btn-default" onclick="deleteCon()">제공 취소</a></td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="col-sm-10">	
	<br>
	<h2>재능신청 내역</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-hover" id="tblist">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">번호</th>
				<th width="10%">글번호</th>
				<th width="10%">분야1</th>
				<th width="10%">분야2</th>
				<th width="10%">희망자 이름</th>
				<th width="10%">받은 날짜</th>
				<th width="10%">기부상태</th>
				<th width="10%">신청취소</th>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="tb" items="${tblist}">
		 		<tr>
		 			<td>${tb.midx}</td>
		 			<td>${tb.tbidx}</td>
					<td>${tb.tbcategory1}</td>
					<td>${tb.tbcategory2}</td>
					<td>${tb.mid}</td>
					<td>${tb.tbhdate}</td>
					<td>${tb.tbstate}</td>
					<td><a class="btn btn-default" href="${ContextPath}/controller/TalentBoardCancleServlet.do?midx=${tb.midx}">신청 취소</a></td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
<script>
function deleteCon(){
 	if(confirm("제공을 취소하시겠습니까?") == true){
		location.href="TalentBoardDeleteCancleServlet.do?tbidx=${tb.tbidx}";
  	}else{
  		alert("요청이 취소되었습니다.");
  	}
 }
</script>
</body>
</html>