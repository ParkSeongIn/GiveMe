<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후원 사이드바</title>
<link rel="stylesheet" href="../css/sidebar.css" type="text/css">
</head>
<body>
		<div class="side3">
				<h2><후원하기></h2>
			<nav class="lnb">
				<ul>
					<li class="m" ><a href="./sidebar.jsp">현금기부</a></li>
					<li class="h"><a href="<%=request.getContextPath()%>/controller/TalentBoardListServlet.do">재능기부</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>