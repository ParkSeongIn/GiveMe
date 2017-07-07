<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.allboard.AllBoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부동향 리스트</title>
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
width : 940px;
height : 80px;
margin-bottom : 10px;
text-align : center;
vertical-align : middle;
}
</style>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar2.jsp" %>
<body>
<div class="wrap"> <!-- div로 묶음 -->
<%
ArrayList<AllBoardVo> ablist = (ArrayList<AllBoardVo>)request.getAttribute("ablist");

%>

<table class="table table-striped table-bordered table-hover ">

<tr>
<td>이미지</td><td>제목</td><td>내용</td> <!-- 테이블 생성 -->
</tr>
<% for (AllBoardVo ab : ablist) { %>
<tr>
<td><%=ab.getAbimage() %></td><td><%=ab.getAbtitle()%></td>
<td><a href="<%=request.getContextPath()%>/controller/AllBoardContentServlet.do?abidx=<%=ab.getAbidx() %>"><%=ab.getAbcontent() %></td>
</tr>
<% } %>
</table>
	<div>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardWriteServlet.do">게시글 입력</a>
	</div>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>