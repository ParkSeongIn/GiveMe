<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>현금기부(내용)</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.panel-body{
	padding: 30px;
}
div.panel.panel-default{
	margin-left: 300px;
}
h2{
	padding-left: 50px;
}
</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar6.jsp"/>
	<div class="container" style="margin-top:80px">
		<div class="panel panel-default" style="width:700px;">
			<h2>현금기부</h2>
			<div class="panel-body">
				<div class="form-horizontal">
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">기부자명</label>
						<div class="col-sm-4">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">날짜</label>
						<div class="col-sm-4">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">기부방법</label>
						<div class="col-sm-4">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">금액</label>
						<div class="col-sm-4">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
				<hr color="black" width="100%" align="left">
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">납부방법</label>
						<div class="col-sm-6">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group" style="height:30px;">
						<label class="control-label col-sm-4" for="">결제여부</label>
						<div class="col-sm-6">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="col-sm-3">
							<%-- 버튼 입력 자리 --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="/nav/footer.jsp"/>	
</body>
</html>