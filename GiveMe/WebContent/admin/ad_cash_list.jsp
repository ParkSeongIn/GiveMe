<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.cashdonation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	*{
		font-family: "Noto Sans KR","Nanum Brush Script";
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CashDonation List</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
<%
	ArrayList<CashDonationVo> cdlist = (ArrayList<CashDonationVo>)request.getAttribute("cdlist");
%>
	<table class="table table-striped table-bordered table-hover" style="width:800px;margin:0 auto;text-align:center;">

		<tr>
			<td style="width:20%">cidx</td>
			<td style="width:20%">회원번호</td>
			<td style="width:40%">후원방법</td>
			<td style="width:40%">기부금액</td>
			<td style="width:40%">기부상태</td>
			<td style="width:40%">결제상태</td>
			<td style="width:40%">영수증</td>
			
		</tr>
		
		<% for (CashDonationVo cd : cdlist) {  %>
		<tr>
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/admin/CashDonationContentServlet.do?cidx=<%=cd.getCidx()%>"><%=cd.getCidx() %></a></td>
			<td><%=cd.getMidx() %></td>
			<td><%=cd.getCway() %></td>
			<td><%=cd.getCmoney() %></td>
			<td><%=cd.getCstate() %></td>
			<td><%=cd.getCapst() %></td>
			<a class="btn btn-default" href="<%=request.getContextPath()%>/mypage/cash_receipt" style="width:100px;">출력</a>
		</tr>
		<% }%>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="2" style="text-align:right">
				<a class="btn btn-default" href="/main.jsp" style="width:100px;">Home</a>
	  		</td>
		</tr>
	</table>
</div>
</body>
</html>