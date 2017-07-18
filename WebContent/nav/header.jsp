<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="../css/header.css" type="text/css">
<body>
	<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
	<%-- 상단 메뉴 --%>
	<div class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<div class="navbar-brand">
				<a href="${ContextPath}/controller/MainServlet.do">Give Me</a></div>
			</div>
			<ul class="nav navbar-nav">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				소개
				</a>
				<ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/IntroPlanServlet.do" target="_self">기획의도</a></li>
					<li><a href="${ContextPath}/controller/IntroGuideServlet.do" target="_self">사업안내</a></li>
					<li><a href="${ContextPath}/controller/AllBoardIfListServlet.do?abtype=I" target="_self">공지사항</a></li>
				</ul>
				</li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					사업내용
				</a>
				<ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/BusinessCashDonation.do"  target="_self">현금기부</a></li>
					<li><a href="${ContextPath}/controller/BusinessTalentDonation.do" target="_self">재능기부</a></li>
				</ul>
				</li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				후원하기
				</a>
				<ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/CashDonationInsertServlet.do" target="_self">현금기부</a></li>
					<li><a href="${ContextPath}/controller/TalentBoardIndexServlet.do" target="_self">재능기부</a></li>
				</ul>
				</li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				커뮤니티
				</a>
				<ul class="dropdown-menu">
					<li><a href="${ContextPath}/controller/AllBoardListServlet.do?abtype=N" target="_self">기부동향</a></li>
					<li><a href="${ContextPath}/controller/QuestionFaqServlet.do" target="_self">자주하는 질문</a></li>
					<li><a href="${ContextPath}/controller/QuestionWriteServlet.do" target="_self">1:1 문의</a></li>
					<li><a href="${ContextPath}/controller/AllBoardDonationSearchServlet.do" target="_self">기부처 검색</a></li>
				</ul>
				</li>
			</ul>
			
			 <div class="up1" id="login_box"> <!-- div up1 start -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${ContextPath}/controller/MemberCheckLoginServlet.do" >로그인</a></li>
					<li><a href="${ContextPath}/controller/MemberInsertServlet.do">회원가입</a></li> 
				</ul>		
			</div><!-- div up1 end -->
			
			<div class="up1" id="my_box" > <!-- div up1 start -->
				<ul class="nav navbar-nav navbar-right" style="float:right;">
					<li><a>${sessionScope.vo.mid}님 반갑습니다</a></li>
					
					<c:if test="${sessionScope.vo.login == true }">
							<c:set var="grade" value="G"/>
						<c:choose>
						<c:when test="${sessionScope.vo.mgrade == pageScope.grade }">
							<li><a href="${ContextPath}/controller/MemberContentServlet.do">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${ContextPath}/controller/MemberListServlet.do">관리자 페이지</a></li>
						</c:otherwise>
						</c:choose>
					</c:if>
					
					<li><a href="${ContextPath}/controller/MemberCheckLogoutServlet.do">로그아웃</a>
				</ul>		
			</div><!-- div up1 end -->
			
		</div>
	</div>
	<%-- 상단 메뉴 --%>
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