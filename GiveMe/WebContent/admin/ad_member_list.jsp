<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.admin.AdminServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 리스트</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
.wrap{
	height: 500px;
}
.table {
	width:730px;
	float: right;
    margin-right: 316px;
}
</style>
<body>
<%
ArrayList<MemberVo> list = (ArrayList<MemberVo>)request.getAttribute("list");
%>

<c:import url="/nav/header.jsp"/>
<c:import url="/nav/ad_sidebar.jsp"/>
<div class = "wrap">
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>		
		<h2>회원관리</h2>
		<table class="table table-striped table-bordered table-hover" id="list">
		  <thead>
			<tr>
				<td>회원번호</td>
				<td>이름</td>
				<td>아이디</td>
				<td>이메일</td>
				<td>회원가입날짜</td>
				<td>회원상태</td>
			</tr>
		  <thead>
		   <tbody>	
			<c:forEach var="vo" items="${requestScope.list}">
				<c:choose>
					<c:when test="${vo.mvalue == 'IN'}"> 
				<tr>
				<td>${vo.midx}</td>
				<td><a href="${ContextPath }/controller/MemberContentServlet.do?midx=${vo.midx}">${vo.mname}</a></td>
				<td>${vo.mid}</td>
				<td>${vo.mmail}</td>
				<td>${vo.menter}</td>
				<td>${vo.mvalue}</td>
				</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
		</tbody>	
				
		</table>	
	</div>
<c:import url="/nav/footer.jsp"/>	
</body>
</html>