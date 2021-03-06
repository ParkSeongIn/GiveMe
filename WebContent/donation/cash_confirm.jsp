<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.cashdonation.CashDonationVo" %>
<%@ page import = "service.cashdonation.CashDonationServiceImpl" %>  
<%
	request.setCharacterEncoding("UTF-8");
	CashDonationVo vo = (CashDonationVo)request.getAttribute("vo");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>현금기부 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.panel-body{
	padding: 80px;
}
div.panel.panel-default{
	margin-left: 100px;
}
h2{
	padding-left: 50px;
}
</style>

<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
        $('#addButton').click(function(){
            if($('#cway').val().length <1) {
                alert('입력하세요');
                $('#cway').focus();
            } else if($('#cmoney').val()=='') {
                alert('입력하세요');
                $('#cmoney').focus();
            } else if($('#creceipt').val()=='') {
                alert('입력하세요');
                $('#creceipt').focus();
            } else if($('#cpaydate1').val()=='') {
                alert('입력하세요');
                $('#cpaydate1').focus();
            } else if($('#cpay').val()=='') {
                alert('입력하세요');
                $('#cpay').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });
    
</script>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
	<div class="container" style="margin-top:80px">
		<div class="panel panel-default">
			<h2>현금기부</h2>
			<div class="panel-body">
			<form id="addForm" action="<%=request.getContextPath()%>/controller/CashDonationConfirmServlet.do" method="post">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-3" for="cway">기부방식</label>
						<div class="col-sm-5">
							<input type="text" id="cway" class="form-control" disabled="disabled"/><%=vo.getCway() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="cmoney">금액</label>
						<div class="col-sm-6">
							<input type="text" id="cmoney" class="form-control" disabled="disabled"/><%=vo.getCmoney() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="cpay">결제방법</label>
						<div class="col-sm-6">
							<input type="text" id="cpay" class="form-control" disabled="disabled"/><%=vo.getCpay() %>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="creceipt">영수증발급</label>
						<div class="col-sm-6">
							<input type="text" id="creceipt" class="form-control" disabled="disabled"/><%=vo.getCreceipt() %>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="col-sm-3">
							<div>
         					 <input class="btn btn-default" id="addButton" type="button" value="결제"/>
            					<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/MainServlet.do">취소</a>
        					</div>
						</div>
					</div>
			</form>
			</div>
		</div>
	</div>
<c:import url="/nav/footer.jsp"/>	
</body>
</html>