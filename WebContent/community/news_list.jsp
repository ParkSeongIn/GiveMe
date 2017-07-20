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
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.col-sm-10{
	  padding-top: 30px;
	  padding-left: 80px;
}
.news_image{
	height:150px;
	border:1px solid black;
	margin-right:20px;
	margin-bottom:10px;
}
.news_content{
	height:150px;
	border:1px solid black;
	margin-bottom:10px;
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
			<c:forEach var="ab" items="${ablist}">
				<c:choose>
					<c:when test="${ab.abtype=='N' && ab.abdeletest == 2}">
						<c:url var="img_path" value="../upload"/>
			 			<div class="news_image col-sm-4"><img src="${img_path }/${ab.abimage}"></div>
						<div class="news_content col-sm-7" ><a href="${ContextPath}/controller/AllBoardContentServlet.do?abidx=${ab.abidx}">${ab.abcontent}</a></div>
					
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>	
			</c:forEach>
		<div class="col-sm-8"></div>
		<div class="col-sm-4">
		<c:if test="${sessionScope.vo.mgrade == 'A' }">
			<a class="btn btn-default" href="${ContextPath}/controller/AllBoardWriteServlet.do">입력</a>
		</c:if>
	</div>
	</div>
	<%-- 페이징 인디케이터 --%>
		<div class="text-center">
		<ul class="pagination">
			<c:url var="path" value="/controller/AllBoardListServlet.do">
				<c:param name="page_num" value="1"/>
			</c:url>
			<li><a href="${path }"><font color="black">이전</font></a></li>
			
			<c:set var="page_num2" value="${param.page_num }"/>
			<c:if test="${param.page_num == null || param.page_num == '' }">
				<c:set var="page_num2" value="1"/>
			</c:if>
			<c:forEach var="i" begin="${requestScope.indi_min }" end="${requestScope.indi_max}">
				<c:url var="path" value="/controller/AllBoardListServlet.do">
					<c:param name="page_num" value="${i }"/>
				</c:url>
				<c:choose>
					<c:when test="${page_num2 == i }">
						<li><a href="${path }"><font color="black">${i }</font></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${path }"><font color="black">${i }</font></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:url var="path" value="/controller/AllBoardListServlet.do">
				<c:param name="page_num" value="${requestScope.page_cnt }"/>
			</c:url>	
			<li><a href="${path }"><font color="black">다음</font></a></li>
		</ul>
		</div>
		<%-- 페이징 인디케이터 --%>
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>