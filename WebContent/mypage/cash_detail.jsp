<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import ="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.cashdonation.*" %>
<%@ page import = "service.member.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
CashDonationVo cv = (CashDonationVo)request.getAttribute("cv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현금후원내역(마이페이지)</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style>
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
}
select{
	width :200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
select::-ms-expand { /* for IE 11 */
    display: none;
}
.total{
	float:right;
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
	<h2>현금기부 내역</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	
	<h3>정기후원</h3>
	<table class="table table-hover" id="clist">
		<thead>
			<tr>
				<th width="5%" align="center" valign="middle">번호</th>
				<th width="10%">금액</th>
				<th width="15%">납입방법</th>
				<th width="15%">후원날짜</th>
				<th width="10%">월 출금일</th>
				<th width="10%">후원상태</th>
				<th width="10%">영수증</th>
				<th width="20%">마일리지</th>
				<th width="20%">취소</th>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="cv" items="${clist}">
		 	   <c:choose>
		 	   	  <c:when test="${cv.cway=='정기후원'}">	
		 		<tr>
		 			<td>${cv.cidx}</td>
					<td>&#8361; ${cv.cmoney}</td>
					<td>${cv.cpay}</td>
					<td>${cv.cpaydate2}</td>
					<td>월${cv.cpaydate1}일</td>
					<td>${cv.cstate}</td>	
					<td><a href="${ContextPath}/controller/CashDonationReceiptServlet.do?cidx=${cv.cidx}" class="btn btn-default"onclick="window.open(this.href,'영수증','width=510, height=620, left=100px,top=100px,scrollbars=yes');return false;" target="_blank">
							영수증 출력</a></td>
					<td>${cv.cpoint}포인트</td>
					<c:choose>
						<c:when test="${cv.cstate=='후원완료' }">
						<td><a href="${ContextPath}/controller/CashDonationModifyStateServlet.do?cidx=${cv.cidx}" class="btn btn-default" onclick="deleteCon()">후원취소</a></td>	
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>	
				
				</tr>	
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>	
		</c:forEach>		
		</tbody>
	</table>
	<h3>일시후원</h3>
	<table class="table table-hover" id="clist">
		<thead>
			<tr>
				<th width="10%" align="center" valign="middle">번호</th>
				<th width="10%">금액</th>
				<th width="10%">납입방법</th>
				<th width="10%">후원날짜</th>
				<th width="10%">후원상태</th>
				<th width="20%">마일리지</th>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="cv" items="${clist}">
		 	  <c:choose>
		 	  <c:when test="${cv.cway=='일시후원'}">	
		 		<tr>
		 			<td>${cv.cidx}</td>
					<td>&#8361; ${cv.cmoney}</td>
					<td>${cv.cpay}</td>
					<td>${cv.cpaydate2}</td>
					<td>${cv.cstate}</td>
					<td>${cv.cpoint}포인트</td>
				</tr>	
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>	
		</c:forEach>		
		</tbody>
	</table>
	<div class="total" >
	<hr color="#D5D5D5" width="100%" align="left">
	
	<c:set var="sum" value="${cv.cmoney }"/>
	<c:forEach var="cv" items="${clist }">
		<c:set var="sum" value="${sum+cv.cmoney }"/>
	</c:forEach>
	<h3>총 후원금액 : &#8361; ${sum}</h3>
	
	<c:set var="sum" value="${cv.cpoint }"/>
	<c:forEach var="cv" items="${clist }">
		<c:set var="sum" value="${sum+cv.cpoint }"/>
	</c:forEach>
	<h3>총 마일리지 : ${sum}</h3>
	</div>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
<script>
function deleteCon(){
 	if(confirm("후원을 취소하시겠습니까?") == true){
		location.href="CashDonationModifyStateServlet.do?cidx=${cv.cidx}";
  	}else{
  	}
 }
</script>
</body>
</html>