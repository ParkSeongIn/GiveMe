<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="service.admin.*" %>
<%@ page import = "service.question.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin QNA List</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	*{
		font-family: "Noto Sans KR","Nanum Brush Script";
	}
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
<c:import url="/nav/sidebar6.jsp"/>

<div class="container">
<%
	ArrayList<QuestionVo> aqlist = (ArrayList<QuestionVo>) request.getAttribute("aqlist");
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
	<div class="col-sm-10">
	<h2>1:1문의 목록</h2>
	<table class="table table-striped table-bordered table-hover" style="width:800px;margin:0 auto;text-align:center;">
		<tr>
			<!-- mname 추가 -->
			<td style="width:20%">글번호 qidx</td>
			<td style="width:40%">유형 qcategory</td>
			<td style="width:40%">글제목 qtitle</td>
			<td style="width:40%">답변유무 qstate</td>
			<td style="width:40%">작성날짜 qwdate</td>
			<td style="width:40%">글 삭제상태 qdeletest</td>
		</tr>
		
		<% for (QuestionVo qd : aqlist) {  %>
		<tr>
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AdQuestionContentServlet.do?qidx=<%=qd.getQidx()%>"><%=qd.getQidx() %></a></td>
			<td><%=qd.getQcategory() %></td>
			<td><%=qd.getQtitle() %></td>		
			<td><%=qd.getQstate() %></td>
			<td><%=qd.getQwdate() %></td>
			<td><%=qd.getQdeletest() %></td>
		<%} %>	
		</tr>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="5" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AdQuestionWriteServlet.do" target="_self">작성하기</a>
	  		</td>
		</tr>
	</table>
	</div>
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>