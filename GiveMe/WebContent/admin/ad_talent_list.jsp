<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.talentboard.TalentBoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 재능기부 리스트</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar4.jsp" %>
<body>
<div class="container">
<h2>재능기부 내역 관리자 페이지</h2>
<%
ArrayList<TalentBoardVo> tblist = (ArrayList<TalentBoardVo>)request.getAttribute("tblist");

%>
<table class="table table-striped table-bordered table-hover ">
<tr>
기부 상태를 클릭해도 기부 프로세스가 나타납니다. <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardWriteServlet.do">기부 프로세스</a>
</tr>
<tr>
<td>글번호</td><td>후원자</td><td>신청자</td><td>작성날짜</td><td>매칭여부</td><td>매칭확인</td>
</tr>
<% for (TalentBoardVo tb : tblist) { %>
<tr>
<td><a href="<%=request.getContextPath()%>/controller/TalentBoardAdContentServlet.do?tbidx=<%=tb.getTbidx() %>"><%=tb.getTbidx() %></td><td><%=tb.getTbpeople()%></td><td><%=tb.getTbpeople()%></td>
<td><%=tb.getTbwdate() %></td><td><%=tb.getTbstate() %></td><td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardEtimeServlet.do?tbidx=<%=tb.getTbidx() %>">매칭확인</a></td>
</tr>
<% } %>
</table>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>