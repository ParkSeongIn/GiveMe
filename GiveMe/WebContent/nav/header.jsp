<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP_MENU</title>

<link rel="stylesheet" href="../css/header.css" type="text/css">
</head>
<body>
	<div class="mainup" clearfix>
	 	<div class="upLeft"><!-- upLeft start -->
			<h1>GiveMe</h1>
		</div><!-- upLeft end -->
	 	
	<!-- 	<div class="upRight">	 --><!-- upRight start -->
			<div class="up1" id="login_box"> <!-- div up1 start -->
				<ul class="side1">
					<li><a href="#">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/controller/MemberCheckLoginServlet.do" >로그인</a></li>
					<li><a href="<%=request.getContextPath()%>/controller/MemberInsertServlet.do">회원가입</a></li> 
					<li><a href="#">검색</a></li>
				</ul>		
			</div><!-- div up1 end -->
			
			<div class="up1" id="my_box" > <!-- div up1 start -->
				<ul class="side1">
					<li><a href="#">Home</a></li>
					<li>${sessionScope.vo.mid}님 반갑습니다.</li>
					<c:if test="${sessionScope.vo.login == true }">
							<c:set var="mng_grade" value="<%=Values.grade_admin%>"/>
						<c:choose>
						<c:when test="${sessionScope.vo.mgrade == pageScope.mng_grade }">
							<li><a href="#">관리자 페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<%=request.getContextPath()%>/controller/MemberContentServlet.do">마이페이지</a></li>
						</c:otherwise>
						</c:choose>
					</c:if>
					
					<li><a href="<%=request.getContextPath()%>/controller/MemberCheckLogoutServlet.do">로그아웃</a>
					<li><a href="#">검색</a></li>
				</ul>		
			</div><!-- div up1 end -->
			
			<div class="up2"><!--  div up2 start-->	
				<ul class="side2">
					<li>소개
						<ul>
							<li><a href="#">기획의도</a></li>
							<li><a href="./intro/guide.jsp">사업안내</a></li>
							<li><a href="#">공지사항</a></li>						
						</ul>				
					</li>
					<li>사업내용
						<ul>
							<li><a href="#">현금기부</a></li>
							<li><a href="#">재능기부</a></li>						
						</ul>	
					</li>
					<li>후원하기
						<ul>
							<li><a href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationInsertServlet.do">현금기부</a></li>
							<li><a href="#">재능기부</a></li>					
						</ul>	
					</li>
					<li>커뮤니티
						<ul>
							<li><a href="#">기부동향</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="#">기부처 검색</a></li>
						</ul>	
					</li>						
				</ul>
			</div><!--  div up2 end-->	
					
	<!-- 	</div> --><!-- upRight end -->
	</div><!--  div mainup end-->
	
	
<script>

var chkLogIn = '<c:out value="${sessionScope.vo.login}" />';
var login_box = document.getElementById("login_box"); 
var my_box = document.getElementById("my_box");

(function(){

	if(chkLogIn == "true"){
		login_box.style.display = "none";
		my_box.style.display = "block";
	}else{
		login_box.style.display = "block";
		my_box.style.display = "none";
	}	
})();

</script>
</body>
</html>