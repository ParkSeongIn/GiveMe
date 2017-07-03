<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
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
<body>
<div class="container">
<%
	ArrayList<QuestionVo> qlist = (ArrayList<QuestionVo>) request.getAttribute("qlist");
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
			
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/question/QuestionContentServlet.do?qidx=<%=qd.getQidx()%>"><%=qd.getQidx() %></a></td>
			<td><%=qd.getQcategory() %></td>
			<td><%=qd.getQtitle() %></td>		
			<td><%=qd.getQstate() %></td>
			<td><%=qd.getQwdate() %></td>
		</tr>
		<% }%>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="2" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/question/QuestionWriteServlet.do" target="_self">작성하기</a>
	  		</td>
		</tr>
	</table>
</div>
</body>
</html>