<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>   
<%@ page import = "service.admin.*" %>
   
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부처리스트 목록</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div class="container">
<%
ArrayList<DonationListVo>  list = (ArrayList<DonationListVo>)request.getAttribute("list");
%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<h1>기부처리스트 목록</h1>
	<table class="table table-striped table-bordered table-hover" id="donation_list">
		<thead>	
			<tr>
				<td>기부처리스트 번호</td>
				<td>분류</td>
				<td>이름</td>
				<td>작성자</td>
				<td>지역</td>
				<td>등록일자</td>
				<td>삭제상태</td>
			</tr>
		<thead>
		<tbody>	
			<c:forEach var="vo" items="${requestScope.list}">
				<c:choose>
					<c:when test="${vo.dldeletest == 'N'}"> 
				<tr>
				<td><a href="${ContextPath}/controller/DonationContentServlet.do?dlidx=${vo.dlidx}">${vo.dlidx}</a></td>
				<td>${vo.dlgroup2}</td>
				<td>${vo.dlplace}</td>
				<td>${vo.dlid}</td>
				<td>${vo.dlarea}</td>
				<td>${vo.dlwdate}</td>
				<td>${vo.dldeletest}</td>
				</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
		</tbody>	
	</table>
	
<div>
<c:if test="${sessionScope.vo.login == true }">
<a class="btn btn-default" href="${ContextPath }/controller/DonationWriteServlet.do">입력</a>
</c:if>
</div>
	
</div>
</body>
</html>