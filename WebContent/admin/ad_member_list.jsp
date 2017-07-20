<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.admin.AdminServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 리스트</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function searchList(){
		
		if(document.search.keyField.value=="0"){
			alert("검색 키워드를 입력하세요");
			document.search.keyField.focus();
			return;			
		}else if(document.search.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.search.keyWord.focus();
			return;
		}		
	}
</script>
</head>
<style>
div.col-sm-10{
	  padding-top: 60px;
	  padding-left: 80px;
}
</style>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar6.jsp"/>
<div class = "container">
		<div class="col-sm-10">		
		<h2>회원관리</h2>
		<hr color="#D5D5D5" width="40%" align="left">
		<table class="table table-striped table-bordered table-hover" id="list">
		  <thead>
			<tr>
				<td>회원등급</td>
				<td>회원번호</td>
				<td>이름</td>
				<td>아이디</td>
				<td>이메일</td>
				<td>회원가입날짜</td>
				<td>회원상태</td>
			</tr>
		  <thead>
		   <tbody>	
			<c:forEach var="vo" items="${list}">
				<tr>
				<c:choose>
					<c:when test="${vo.mgrade == 'G' }">
				<td>일반회원</td>
				</c:when>
				<c:otherwise>
				<td>관리자</td>
				</c:otherwise>
				</c:choose>
				<td>${vo.midx}</td>
				<td><a href="${ContextPath }/controller/MemberContentServlet.do?midx=${vo.midx}">${vo.mname}</a></td>
				<td>${vo.mid}</td>
				<td>${vo.mmail}</td>
				<td>${vo.menter}</td>
				
				<c:choose>
					<c:when test="${vo.mvalue == 1 }">
				<td>회원</td>
					</c:when>
				<c:otherwise>
				<td>탈퇴회원</td>
				</c:otherwise>
				</c:choose>
				
				</tr>
			</c:forEach>	
		</tbody>	
				
		</table>
		<br/><br/>
		<form name="search" method="post" action="<%=request.getContextPath()%>/controller/MemberListServlet.do" onsubmit="return searchList()">
				<select name="keyField">
					<option value="0">---선택---</option>
					<option value="mid">아이디</option>
					<option value="mname">이름</option>
					<option value="mphone">전화번호</option>
					<option value="mvalue">회원상태</option>								
				</select>
				
				<input type="text" name="keyWord">
				<input type="submit" value="검색">
			</form>			
	</div>
	<%-- 페이징 인디케이터 --%>
		<div class="text-center">
		<ul class="pagination">
			<c:url var="path" value="/controller/MemberListServlet.do">
				<c:param name="page_num" value="1"/>
			</c:url>
			<li><a href="${path }"><font color="black">이전</font></a></li>
			
			<c:set var="page_num2" value="${param.page_num }"/>
			<c:if test="${param.page_num == null || param.page_num == '' }">
				<c:set var="page_num2" value="1"/>
			</c:if>
			<c:forEach var="i" begin="${requestScope.indi_min }" end="${requestScope.indi_max}">
				<c:url var="path" value="/controller/MemberListServlet.do">
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
			<c:url var="path" value="/controller/MemberListServlet.do">
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