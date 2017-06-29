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
<title>현금기부 관리자 리스트</title>
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
	ArrayList<CashDonationListVo> cdlist = (ArrayList<CashDonationListVo>) request.getAttribute("cdlist");
%>
	<table class="table table-striped table-bordered table-hover" style="width:800px;margin:0 auto;text-align:center;">
`
		<tr>
			
			<td style="width:20%">cidx</td>
			<td style="width:20%">회원번호 midx</td>
			<td style="width:40%">회원이름 mname</td>
			<td style="width:40%">후원방법 cway</td>
			<td style="width:40%">기부금액 cmoney</td>
			<td style="width:40%">기부날짜 apdbdate</td>
			<td style="width:40%">기부상태 cstate</td>
			<td style="width:40%">결제상태 capst</td>
			<td style="width:20%">기부처번호 dlidx</td>
			<td style="width:20%">결제번호 apidx</td>
			<td style="width:40%">기부처 dlgroup1</td>
			<td style="width:40%">기부처 dlgroup2</td>
			<td style="width:40%">기부지역 dlplace</td>
			
		</tr>
		
		<% for (CashDonationListVo cd : cdlist) {  %>
		<tr>
			
			<td><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/admin/CashDonationContentServlet.do?cidx=<%=cd.getCidx()%>"><%=cd.getCidx() %></a></td>
			<td><%=cd.getMidx() %></td>
			<td><%=cd.getMname() %></td>
			<td><%=cd.getCway() %></td>
			<td><%=cd.getCmoney() %></td>
			<td><%=cd.getApdbdate() %></td>
			<td><%=cd.getCstate() %></td>
			<td><%=cd.getCapst() %></td>
			<td><%=cd.getDlidx() %></td>
			<td><%=cd.getApidx() %></td>
			<td><%=cd.getDlgroup1() %></td>
			<td><%=cd.getDlgroup2() %></td>
			<td><%=cd.getDlplace() %></td>
		</tr>
		<% }%>
		<tr>
			<td style="line-height:2.3;">
				작업
			</td>
			<td colspan="2" style="text-align:right">
				<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">Home</a>
				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationInsertServlet.do" target="_blank">후원하기</a>
	  		</td>
		</tr>
	</table>
</div>
</body>
</html>