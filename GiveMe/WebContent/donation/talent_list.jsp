<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.talentboard.TalentBoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능기부 게시판</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<style>
.table {
width : 920px;
height : 408px;
margin-bottom : 10px;
text-align : center;
vertical-align : middle;
}
</style>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar3.jsp" %>
<body>
<div class="container"> <!-- div로 묶음 -->
<%
ArrayList<TalentBoardVo> tblist = (ArrayList<TalentBoardVo>)request.getAttribute("tblist");

%>
<table class="table table-striped table-bordered table-hover ">
<tr>
<td>언어</td><td>컴퓨터</td><td>음악</td><td>디자인</td><td>수공예</td><td>기타</td>
</tr>
<tr>
<td><select name='user' size='6'>
    <option value='' selected>-- 제공 유형 --</option>
    <option value='give'>제공자</option>
    <option value='help'>신청자</option>
</select></td>
<td><select name='lan' size='6'>
    <option value='' selected>-- 언어  --</option>
    <option value="영어">영어</option>
    <option value="중국어">중국어</option>
    <option value="일본어">일본어</option>
    <option value="기타">기타</option>
</select></td>
</tr>
<tr>
<td>글번호</td><td>작성자 분류</td><td>글제목</td><td>작성자</td><td>조회수</td><td>작성날짜</td>
</tr>
<% for (TalentBoardVo tb : tblist) { %>
<tr>
<td><%=tb.getTbidx() %></td><td><%=tb.getTbpeople()%></td>
<td><a href="<%=request.getContextPath()%>/controller/TalentBoardContentServlet.do?tbidx=<%=tb.getTbidx() %>"><%=tb.getTbtitle() %></td>
<td><%=tb.getMidx() %></td><td><%=tb.getTbhit() %></td><td><%=tb.getTbwdate() %></td>
</tr>
<% } %>
</table>
<c:if test="${sessionScope.vo.login == true }">
	<div>
		<center><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardWriteServlet.do">게시글 입력</a></center>
	</div>
</c:if>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>