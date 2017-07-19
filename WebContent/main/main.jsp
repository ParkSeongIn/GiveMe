<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.allboard.*" %>
<%@ page import = "service.cashdonation.*" %>
<%@ page import ="java.util.*" %>
<%
ArrayList<AllBoardVo> ablist = (ArrayList<AllBoardVo>)request.getAttribute("ablist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<style>
font{
	text-decoration:underline;
	text-align:center;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
	
	<div class="container">
		<%-- carousel --%>
		<div class="row">
			<div class="col-sm-12">
				<div id="c1" class="carousel slide" data-ride="carousel">
					<%-- 슬라이드될 이미지를 배치 --%>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="http://placehold.it/1600x600?text-banner" >
						</div>
					</div>
					<%-- indicator --%>
				<ol class="carousel-indicators">
					<li data-target="#c1" data-slide-to="0" class="active"></li>
					<li data-target="#c1" data-slide-to="1"></li>
					<li data-target="#c1" data-slide-to="2"></li>
				</ol>
				<%-- 좌우 이동 버튼 --%>
				<a href="#c1" class="carousel-control left" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a href="#c1" class="carousel-control right" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
				</div>
				
			</div>
		</div>
		<%-- carousel --%>
		
	<%-- 상단부 게시판 목록 2개 --%>
	<br/>
	<div class="row">
		<div class="col-sm-4">
		 <div class="panel panel-default">
			<div class="panel-body" style="padding:0;">
			<img src="../image/guide.jpg" style="width: 358px;;">
			<center>이용가이드 입니다.<br/></center>
			<center><a href="${ContextPath}/controller/GuideServlet.do" class="btn btn-default">이용가이드</a></center>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-body">
			<center><h2>현재 <font>10000000원</font>이 <br/>후원되었습니다.</h2></center>
			</div>
		</div>
		</div>
		<div class="col-sm-8">
			<div class="panel panel-default">
				<div class="panel-heading">
					공지사항 
					<a href="${ContextPath}/controller/AllBoardIfListServlet.do?abtype=I" style="float: right; color: black">더보기</a>
				</div>
				
				<div class="panel-body">
					<table class="table table-hover" id="ablist">
						<thead>
							<tr>
								<th width="480px;">제목</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var="av" items="${ablist}">
									<c:choose>
										<c:when test="${av.abtype == 'I' }">
									<tr>
										<td>${av.abtitle }</td>
										<td>${av.abwdate }</td>
									</tr>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-8">
			<div class="panel panel-default">
				<div class="panel-heading">
					기부동향 
					<a href="${ContextPath}/controller/AllBoardListServlet.do?abtype=N" style="float: right; color: black">더보기</a>
				</div>
				<div class="panel-body">
					<table class="table table-hover" id="ablist">
						<thead>
							<tr>
								<th width="480px;">제목</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var="av" items="${ablist}">
									<c:choose>
										<c:when test="${av.abtype == 'N' }">
									<tr>
										<td>${av.abtitle }</td>
										<td>${av.abwdate }</td>
									</tr>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%-- 상단부 게시판 목록 2개 --%>
	</div>
	
	<c:import url="/nav/footer.jsp"/>
</body>
</html>