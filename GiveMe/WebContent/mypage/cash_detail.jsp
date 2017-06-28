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
<title>마이페이지 현금기부 리스트</title>
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
	ArrayList<CashDonationListVo> mcdlist = (ArrayList<CashDonationListVo>) request.getAttribute("mcdlist");
%>
	<table class="table table-striped table-bordered table-hover" style="width:800px;margin:0 auto;text-align:center;">
`
		<tr>
			<td style="width:20%">rnum</td>
			<td style="width:20%">회원번호 midx</td>
			<td style="width:40%">후원방법 cway</td>
			<td style="width:40%">기부금액 cmoney</td>
			<td style="width:40%">납입방법 cpay</td>
			<td style="width:40%">기부날짜 apdbdate</td>
			<td style="width:40%">기부상태 cstate</td>
			<td style="width:20%">기부처번호 dlidx</td>
			<td style="width:20%">결제번호 apidx</td>
			<td style="width:20%">현금기부 번호 cidx</td>
			<td style="width:40%">기부처 dlgroup1</td>
			<td style="width:40%">영수증 receipt</td>
		</tr>
		
		<% for (CashDonationListVo cd : mcdlist) {  %>
		<tr>
			<td><%=cd.getRnum() %></td>	
			<td><%=cd.getMidx() %></td>	
			<td><%=cd.getCway() %></td>
			<td><%=cd.getCmoney() %></td>
			<td><%=cd.getCpay() %></td>
			<td><%=cd.getApdbdate() %></td>
			<td><%=cd.getCstate() %></td>
			<td><%=cd.getDlidx() %></td>
			<td><%=cd.getApidx() %></td>			
			<td><%=cd.getCidx() %></td>
			<td><%=cd.getDlgroup1() %></td>
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationReceiptServlet.do" style="width:100px;">출력</a><td>
		</tr>
		<% }%>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="2" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/donation/cash_insert.jsp" target="_blank">후원하기</a>
	  		</td>
		</tr>
	</table>
</div>
</body>
</html>