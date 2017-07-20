<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.allboard.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function noticesearchList(){
		
		if(document.noticesearch.keyField.value=="0"){
			alert("검색 키워드를 입력하세요");
			document.noticesearch.keyField.focus();
			return;			
		}else if(document.noticesearch.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.noticesearch.keyWord.focus();
			return;
		}		
	}
</script>
<style>
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
}
</style>
</head>

<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar1.jsp"/>
	
	<div class="container">
	<div class="col-sm-10">	
	<br>
	<h2>공지사항</h2>
	<hr color="#D5D5D5" width="40%" align="left">
	<table class="table table-striped table-bordered table-hover" id="notic_board_list">
		<thead>
			<tr>
				<td width="10%" align="center" valign="middle">글 번호</td>
				<td width="20%">글제목</td>
				<td width="10%">작성자</td>
				<td width="10%">조회수</td>
				<td width="20%">작성날짜</td>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="ab" items="${ablist}">
		 		<c:choose>
		 			<c:when test="${ab.abtype=='I' && ab.abdeletest == 2}">
		 		<tr>
		 			<td>${ab.abidx}</td>
					<td><a href="${ContextPath}/controller/AllBoardIfContentServlet.do?abidx=${ab.abidx}">${ab.abtitle}</a></td>
					<td>${ab.abid}</td>
					<td>${ab.abhit}</td>
					<td>${ab.abwdate}</td>
				</tr>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>					
			</c:forEach>
		</tbody>
	</table>
	<br>
		<form name="noticesearch" method="post" action="<%=request.getContextPath()%>/controller/AllBoardIfListServlet.do" onsubmit="return noticesearchList()">
			<select name="keyField">
				<option value="0">---선택---</option>
				<option value="abid">작성자</option>	
				<option value="abtitle">제목</option>
			</select>
			
			<input type="text" name="keyWord">
			<input type="submit" value="검색">
		</form>	
		
		<div class="col-sm-8"></div>
		<div class="col-sm-4">
		<c:if test="${sessionScope.vo.mgrade == 'A' }">
			<a class="btn btn-default" href="${ContextPath}/controller/AllBoardIfWriteServlet.do">입력</a>
		</c:if>
		</div>
	</div>
	<%-- 페이징 인디케이터 --%>
		<div class="text-center">
		<ul class="pagination">
			<c:url var="path" value="/controller/AllBoardIfListServlet.do">
				<c:param name="page_num" value="1"/>
			</c:url>
			<li><a href="${path }"><font color="black">이전</font></a></li>
			
			<c:set var="page_num2" value="${param.page_num }"/>
			<c:if test="${param.page_num == null || param.page_num == '' }">
				<c:set var="page_num2" value="1"/>
			</c:if>
			<c:forEach var="i" begin="${requestScope.indi_min }" end="${requestScope.indi_max}">
				<c:url var="path" value="/controller/AllBoardIfListServlet.do">
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
			<c:url var="path" value="/controller/AllBoardIfListServlet.do">
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