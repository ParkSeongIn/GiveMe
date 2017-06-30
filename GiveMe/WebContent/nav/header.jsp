<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더</title>
</head>
<body>
	<div class="mainup" clearfix>
	 	<div class="upLeft"><!-- upLeft start -->
			<h1>GiveMe</h1>
		</div><!-- upLeft end -->
	 	
	<!-- 	<div class="upRight">	 --><!-- upRight start -->
			<div class="up1"> <!-- div up1 start -->
				<ul class="side1">
					<li><a href="#">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/member/login.jsp">로그인</a></li>
					<li><a href="<%=request.getContextPath()%>/member/join.jsp" >회원가입</a></li>
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
</body>
</html>