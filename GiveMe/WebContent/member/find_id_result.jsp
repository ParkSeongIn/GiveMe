<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class= "wrap">
		<c:import url="/nav/header.jsp"/>
		<div class="container" style="width:600px; height:400px; margin-top:100px;">
		<%-- 아이디 찾기 성공했을 때 --%>
		<c:choose>
			<c:when test="${requestScope.mid != null }">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>아이디 찾기</h4>
					</div>
					<div class="panel-body" style="font-family:black;">
						당신의 아이디는'${requestScope.mid}'입니다.
					</div>
				</div>
				<a href="<%=request.getContextPath()%>/controller/MemberFindpwdServlet.do" class="btn btn-default btn-block">비밀번호찾기</a>
				<a href="<%=request.getContextPath()%>/controller/MemberCheckLoginServlet.do" class="btn btn-default btn-block">로그인하기</a>
				<br/><br/>
				<%-- 아이디 찾기 성공했을 때 --%>
			</c:when>
			<c:otherwise>
				<%-- 아이디 찾기를 실패했을 때 --%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>아이디 찾기</h4>
					</div>
					<div class="panel-body">
						아이디를 찾을 수 없습니다
					</div>
				</div>
				<a href="<%=request.getContextPath()%>/controller/MemberFindidServlet.do" class="btn btn-default btn-block">아이디/비밀번호 찾기</a>
				<br/><br/>
				<%-- 아이디 찾기를 실패했을 때 --%>
			</c:otherwise>
		</c:choose>
		
	</div>
	<c:import url="/nav/footer.jsp"/>	
	</div>


</body>
</html>