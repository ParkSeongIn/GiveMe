<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<%session.setAttribute("mid", request.getParameter("mid")); %>
<%session.setAttribute("mpwd", request.getParameter("mpwd")); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	*{
		font-family: "Noto Sans KR","Nanum Brush Script";
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA List</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>

<c:import url="/nav/header.jsp"/>
<div class="panel-body">
<div class="container">
<%
	ArrayList<QuestionVo> qlist = (ArrayList<QuestionVo>) request.getAttribute("qlist");
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
	<table class="table table-striped table-bordered table-hover" style="width:800px;margin:0 auto;text-align:center;">
		<tr>
		
		
			<!-- mname 추가 -->
			<td style="width:20%">글번호 qidx</td>
			<td style="width:40%">유형 qcategory</td>
			<td style="width:40%">글제목 qtitle</td>
			<td style="width:40%">답변유무 qstate</td>
			<td style="width:40%">작성날짜 qwdate</td>
		</tr>
		
		<% for (QuestionVo qd : qlist) {  %>
		<tr>
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionContentServlet.do?qidx=<%=qd.getQidx()%>&midx=4"><%=qd.getQidx() %></a></td>
			<td><%=qd.getQcategory() %></td>
			<td><%=qd.getQtitle() %></td>		
			<td><%=qd.getQstate() %></td>
			<td><%=qd.getQwdate() %></td>
		<%} %>	
		</tr>

		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="2" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionWriteServlet.do" target="_self">작성하기</a>
	  		</td>
		</tr>
	</table>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>