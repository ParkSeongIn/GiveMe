<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
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
<body>
<div class="container"> <!-- div로 묶음 -->
<%
ArrayList<TalentBoardVo> tblist = (ArrayList<TalentBoardVo>)request.getAttribute("tblist");

%>
<table class="table table-striped table-bordered table-hover ">
<h2>재능 후원 내역</h2>
<tr>
<td>회원번호</td><td>분야1</td><td>분야2</td><td>희망자 이름</td><td>제공날짜</td><td>기부 상태</td><td>제공 취소</td>
</tr>
<% for (TalentBoardVo tb : tblist) { %>
<tr>
<td><%=tb.getMidx() %></td><td><%=tb.getTbcategory1()%></td><td><%=tb.getTbcategory2()%></td>
<td><%=tb.getTbidx() %></td><td><%=tb.getTbhdate() %></td>
<td><%=tb.getTbstate() %></td><td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardCancleServlet.do?midx=<%=tb.getMidx()%>">제공 취소</td>
</tr>
<% } %>
</table>
<table class="table table-striped table-bordered table-hover ">
<h2>재능 신청 내역</h2>
<tr>
<td>회원번호</td><td>분야1</td><td>분야2</td><td>기부자 이름</td><td>받은날짜</td><td>기부 상태</td><td>신청자 확인</td><td>신청 취소</td>
</tr>
<% for (TalentBoardVo tb : tblist) { %>
<tr>
<td><%=tb.getMidx() %></td><td><%=tb.getTbcategory1()%></td><td><%=tb.getTbcategory2()%></td>
<td><%=tb.getTbidx() %></td><td><%=tb.getTbhdate() %></td>
<td><%=tb.getTbstate() %></td>
<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardConfirmServlet.do?tbidx=<%=tb.getTbidx()%>">신청자 확인</a></td>
<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardCancleServlet.do?midx=<%=tb.getMidx()%>">신청 취소</a></td>
</tr>
<% } %>
</table>
	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardWriteServlet.do">기부 프로세스</a>
	<div>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardWriteServlet.do">게시글 입력</a>
	</div>
</div>
</body>
</html>