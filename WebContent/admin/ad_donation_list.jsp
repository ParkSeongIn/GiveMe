<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>   
<%@ page import = "service.admin.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부처리스트 목록</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function dlsearchList(){
		
		if(document.dlsearch.keyField.value=="0"){
			alert("검색 키워드를 입력하세요");
			document.dlsearch.keyField.focus();
			return;			
		}else if(document.dlsearch.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.dlsearch.keyWord.focus();
			return;
		}		
	}
</script>
<style>
div.col-sm-10{
	  padding-top: 60px;
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
	<h2>기부처리스트 목록</h2>
	<table class="table table-striped table-bordered table-hover" id="list">
		<thead>	
			<tr>
				<td>기부처리스트 번호</td>
				<td>대분류</td>
				<td>소분류</td>
				<td>이름</td>
				<td>작성자</td>
				<td>지역</td>
				<td>등록일자</td>
			</tr>
		<thead>
		<tbody>	
			<c:forEach var="vo" items="${list}">
				<c:choose>
					<c:when test="${vo.dldeletest == 2}"> 
				<tr>
				<td><a href="${ContextPath}/controller/DonationContentServlet.do?dlidx=${vo.dlidx}">${vo.dlidx}</a></td>
				<td>${vo.dlgroup1}</td>
				
				<c:choose>
					<c:when test="${vo.dlgroup1 == '개인' }">
					<td>${vo.dlgroup2}</td>
					</c:when>
					<c:otherwise>
					<td>${vo.dlgroup3 }</td>
					</c:otherwise>
				</c:choose>
				
				<td>${vo.dlplace}</td>
				<td>${sessionScope.vo.mid}</td>
				<td>${vo.dlarea}</td>
				<td>${vo.dlwdate}</td>
				</tr>
					</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
			</c:forEach>	
		</tbody>
			
	</table>
	<form name="dlsearch" method="post" action="<%=request.getContextPath()%>/controller/DonationListServlet.do" onsubmit="return dlsearchList()">
			<select name="keyField">
				<option value="0">---선택---</option>
				<option value="dlarea">지역</option>
				<option value="dlgroup2">분류</option>
				<option value="dlplace">단체 상세</option>										
			</select>
			
			<input type="text" name="keyWord">
			<input type="submit" value="검색">
		</form>	
		<div class="col-sm-8"></div>
		<div class="col-sm-4">
		<c:if test="${sessionScope.vo.login == true }">
			<a class="btn btn-default" style="float:right;"href="${ContextPath}/controller/DonationWriteServlet.do">입력</a>
		</c:if>
		</div>
	</div>
	
	<%-- 페이징 인디케이터 --%>
		<div class="text-center">
		<ul class="pagination">
			<c:url var="path" value="/controller/DonationListServlet.do">
				<c:param name="page_num" value="1"/>
			</c:url>
			<li><a href="${path }"><font color="black">이전</font></a></li>
			
			<c:set var="page_num2" value="${param.page_num }"/>
			<c:if test="${param.page_num == null || param.page_num == '' }">
				<c:set var="page_num2" value="1"/>
			</c:if>
			<c:forEach var="i" begin="${requestScope.indi_min }" end="${requestScope.indi_max}">
				<c:url var="path" value="/controller/DonationListServlet.do">
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
			<c:url var="path" value="/controller/DonationListServlet.do">
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