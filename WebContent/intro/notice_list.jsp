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
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
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
				<th width="10%" align="center" valign="middle">글 번호</th>
				<th width="20%">글제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="20%">작성날짜</th>
			</tr>
		</thead>
		 <tbody>
		 	<c:forEach var="ab" items="${ablist}">
		 		<tr>
		 			<td>${ab.abidx}</td>
					<td><a href="${ContextPath}/controller/AllBoardIfContentServlet.do?abidx=${ab.abidx}">${ab.abtitle}</a></td>
					<td>${ab.abid}</td>
					<td>${ab.abhit}</td>
					<td>${ab.abwdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
		<form name="noticesearch" method="post" action="<%=request.getContextPath()%>/controller/AllBoardIfListServlet.do" onsubmit="return noticesearchList()">
			<select name="keyField">
				<option value="0">---선택---</option>
				<option value="abid">아이디</option>	
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
	</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>