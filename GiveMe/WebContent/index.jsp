<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css">
</head>
<body>
	<div class="container">
			<div class="homename"></div>
				<div class="image" ></div>
					<div class="indexcategory">
						<div class="home"><a class="btn btn-default" href="main.jsp" >HOME</a></div>
						<div class="talent"><a class="btn btn-default" href="#" >재능기부</a></div>
						<div class="cash"><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationInsertServlet.do" >현금기부</a></div>
						<div class="ad_cash_list"><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationListServlet.do" >관리자 현금기부 리스트</a></div>
						<div class="cash_detail"><a class="btn btn-default" href="<%=request.getContextPath()%>/controller/member/MypageCashDonationListServlet.do" >이용자 현금기부 리스트</a></div>
					</div>
	</div>
</body>
</html>