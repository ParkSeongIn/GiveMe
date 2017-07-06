<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티 사이드바</title>
<link rel="stylesheet" href="../css/sidebar.css" type="text/css">
</head>
<body>
		<div class="side3">
				<h2><소개></h2>
			<nav class="lnb">
				<ul>
					<li class="m" ><a href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">기부동향</a></li>
					<li class="h"><a href="<%=request.getContextPath()%>/community/qna_write.jsp">QNA/FAQ</a></li>
					<li class="i"><a href="<%=request.getContextPath()%>/controller/AllBoardDonationSearchServlet.do">기부처 검색</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>
</body>
</html>