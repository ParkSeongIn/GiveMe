<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<%@ page import ="service.member.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
	int qidx = Integer.parseInt(request.getParameter("qidx"));
	MemberVo vo = (MemberVo)session.getAttribute("vo");
	String mid = vo.getMid();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" ></script>
<title>QNA Content</title>
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
div.qna-content{
	width: 177px;
	height: 100px;
	float: right;
	margin-top: 35px;
	margin-right: 68px;
}
</style>
</head>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar4.jsp"/>
<div class="container">	
	<div class="panel-body">
		<div class="col-sm-10">
			<h1>1:1문의 상세내용</h1>
			<table class="table table-bordered" style="width:800px;margin:0 auto;text-align:center;margin-top:100px;">
				<tr>
					<td style="width:20%">회원번호</td>
					<td style="width:40%">글 유형</td>
					<td style="width:40%">작성자</td>
					<td style="width:40%">날짜</td>
				</tr>
				<tr>
					<td><%=qv.getMidx() %></td>
					<td><%=qv.getQcategory() %></td>
					<td>작성자</td>
					<td><%=qv.getQwdate() %></td>
				</tr>
				<tr>
					<th style="width:20%;text-align:center;">제목</th>
					<td colspan="3"><%=qv.getQtitle() %></td>
				</tr>
				<tr>
					<th style="width:20%;text-align:center;">내용</th>
					<td colspan="3"><%=qv.getQcontent() %></td>
				</tr>
				<tr>
					<th style="width:20%;text-align:center;">답변</th>
					<td colspan="3"><%=qv.getQrecontent() %></td>
				</tr>
			</table>
			<div class="qna-content">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionModifyServlet.do?qidx=<%=qidx %>">수정</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionDeleteServlet.do?qidx=<%=qidx %>">삭제</a>
			 	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/QuestionListServlet.do">글목록</a>
			</div> 	
		</div>
	</div>
</div>
       
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>