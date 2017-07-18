<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="service.admin.*" %>
<%@ page import = "service.question.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<QuestionVo> aqlist = (ArrayList<QuestionVo>) request.getAttribute("aqlist");
%>
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
<script>
	function qsearchList(){
		
		if(document.qsearch.keyField.value=="0"){
			alert("검색 키워드를 입력하세요");
			document.qsearch.keyField.focus();
			return;			
		}else if(document.qsearch.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.qsearch.keyWord.focus();
			return;
		}		
	}
</script>
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
	<div class="col-sm-10">
	<h1>1:1문의 목록</h1>
	<table class="table table-hover" style="width:800px;margin:0 auto;text-align:center;margin-top:50px;">
		<tr>
			<!-- mname 추가 -->
			<td style="width:10%">글번호</td>
			<td style="width:10%">유형</td>
			<td style="width:25%">글제목</td>
			<td style="width:10%">작성자</td>
			<td style="width:10%">답변유무</td>
			<td style="width:20%">작성날짜</td>
			<td style="width:15%">글 삭제상태</td>
		</tr>
		
		<% for (QuestionVo qd : aqlist) {  %>
		<tr>
			<td><%=qd.getQidx() %></a></td>
			<td><%=qd.getQcategory() %></td>
			<td><a href="<%=request.getContextPath()%>/controller/AdQuestionContentServlet.do?qidx=<%=qd.getQidx()%>"><%=qd.getQtitle() %></td>		
			<td><%=qd.getMid() %></td>
			<td><%=qd.getQstate() %></td>
			<td><%=qd.getQwdate() %></td>
			<td><%=qd.getQdeletest() %></td>
		<%} %>	
		</tr>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="6" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AdQuestionWriteServlet.do" target="_self">작성하기</a>
	  		</td>
		</tr>
	</table>
	<br>
		<form name="qsearch" method="post" action="<%=request.getContextPath()%>/controller/AdQuestionListServlet.do" onsubmit="return qsearchList()">
			<select name="keyField">
				<option value="0">---선택---</option>
				<option value="mid">아이디</option>
				<option value="qtitle">제목</option>									
			</select>
			
			<input type="text" name="keyWord">
			<input type="submit" value="검색">
		</form>		
	</div>
	
	<%-- 페이징 인디케이터 --%>
		<div class="text-center">
		<ul class="pagination">
			<c:url var="path" value="/controller/AdQuestionListServlet.do">
				<c:param name="page_num" value="1"/>
			</c:url>
			<li><a href="${path }"><font color="black">이전</font></a></li>
			
			<c:set var="page_num2" value="${param.page_num }"/>
			<c:if test="${param.page_num == null || param.page_num == '' }">
				<c:set var="page_num2" value="1"/>
			</c:if>
			<c:forEach var="i" begin="${requestScope.indi_min }" end="${requestScope.indi_max}">
				<c:url var="path" value="/controller/AdQuestionListServlet.do">
					<c:param name="page_num" value="${i }"/>
				</c:url>
				<c:choose>
					<c:when test="${page_num2 == i }">
						<li><a href="${path }"><font color="black">${i }</font></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${path }"><font color="black">${i }</font></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:url var="path" value="/controller/AdQuestionListServlet.do">
				<c:param name="page_num" value="${requestScope.page_cnt }"/>
			</c:url>	
			<li><a href="${path }"><font color="black">다음</font></a></li>
		</ul>
		</div>
		<%-- 페이징 인디케이터 --%>
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>