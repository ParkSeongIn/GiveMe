<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.allboard.AllBoardVo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<style>
.wrap {
height : 550px;
}
.table {
width : 950px;
height : 80px;
margin-bottom : 10px;
text-align : center;
vertical-align : middle;
}
</style>
<body>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar.jsp" %>
<div class="wrap"> <!-- div로 묶음 -->
<%
ArrayList<AllBoardVo> ablist = (ArrayList<AllBoardVo>)request.getAttribute("ablist");
%>
<table class="table table-striped table-bordered table-hover ">

<tr>
<td>제목</td><td>작성자</td>
<td>조회수</td><td>작성날짜</td>
</tr>
<% for (AllBoardVo ab : ablist) { %>
<tr>
<td><%=ab.getAbtitle()%></td>
<td><a href="<%=request.getContextPath()%>/controller/AllBoardIfContentServlet.do?abidx=<%=ab.getAbidx() %>"><%=ab.getAbmdate() %></td>
<td><%=ab.getAbhit() %></td><td><%=ab.getAbwdate() %></td>
</tr>
<% } %>
</table>
	<div>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardIfWriteServlet.do">게시글 입력</a>
	</div>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>