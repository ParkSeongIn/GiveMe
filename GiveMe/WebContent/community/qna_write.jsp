<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>QNA 게시판</title>
</head>
<style>
.wrap{
	height: 800px;
}
.form-group1{
	border: 1px solid black;
	width: 800px;
	height: 300px;
    float: right;
    margin-right: 210px;
}
.form-group2{
	border: 1px solid black;
	width: 800px;
	height: 300px;
    float: right;
    margin-right: 210px;
}
</style>
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar.jsp"/>
<div class="wrap">
	<div class="panel-body">
		<div class="form-group1">
				<div class="faq">
					<font size="5" face="맑은 고딕">FAQ</font>
				</div>
		</div>
		
		<div class="form-group2">
					<div class="qna">
						<font size="5" face="맑은 고딕">QNA</font>
					</div>
		</div>	
	</div>
	
</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>