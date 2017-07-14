<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "java.util.*" %>
<%@ page import = "service.allboard.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부동향</title>
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
<c:import url="/nav/sidebar4.jsp"/>
	
	<div class="container">
	<div class="col-sm-10">	
	<br>
	<h2>기부동향 리스트</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-striped table-bordered table-hover" id="new_board_list">
		<tbody>
			<c:forEach var="ab" items="${ablist}">
		 		<tr>
		 			<td width="300px;">${ab.abimage}</td>
					<td><a href="${ContextPath}/controller/AllBoardContentServlet.do?abidx=${ab.abidx}">${ab.abcontent}</a></td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
		<div class="col-sm-8"></div>
		<div class="col-sm-4">
		<c:if test="${sessionScope.vo.mgrade == 'A' }">
			<a class="btn btn-default" href="${ContextPath}/controller/AllBoardWriteServlet.do">입력</a>
		</c:if>
	</div>
	</div>
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>