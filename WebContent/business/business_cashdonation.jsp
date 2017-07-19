<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Ŀ�</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<style>
div.col-sm-8{
	border: 1px solid #EFEFEF;
    width: 850px;
    height: 230px;
    margin-top:30px;
    padding-left: 0px;
    padding-right: 0px;
}
img{
	 width: 440px;
	 float: right;
}
div.col-sm-5{
	 padding-top: 45px;
	 padding-left: 65px;
}
div.col-sm-2{
    width: 13.666667%;
}
.cash{
	font-size:30px;
}
span{
	font-size:15px;
}
div.periodically, div.temporary{
	font-size:30px;
}
</style>
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar2.jsp"/>
<div class="container">
	<h2>�����Ŀ�</h2>
	<div class="col-sm-8">
			<div class="col-sm-5">
			<font class="cash">�����Ŀ�</font><span>�� �ſ� ������ �ݾ�����<br/> 
			�Ŀ��ϴ� ����Դϴ�.<br/>
			�Ŀ����� ������ �ʿ��� ������� ����<br/> 
			������ ���˴ϴ�.<br/>
			�ֺ��� �ҿܵ� �̿��鿡�� ��������<br/> ������ �ʿ��մϴ�.</span>
			</div>
			<img src="../image/donation.jpg" alt="�����Ŀ�">
	</div>
	<div class="col-sm-2"></div>
	<div class="col-sm-7">
	<h3>�Ŀ���, �̷��� ���˴ϴ�.</h3>
	<hr color="#D5D5D5" width="40%" align="left">
		<div class="periodically">
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>���ҵ��� ����</div>
		-
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>����� ����</div>
		-
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>���ų���</div>
		-
		</div>
		<div class="temporary">
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>������</div>
		-
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>���ü�</div>
		-
		<div style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span>�б��޽�</div>
		-
		</div>
	</div>
	
</div>
</body>
<c:import url="/nav/footer.jsp"/>
</html>