<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.cashdonation.*" %>
<% 
	CashDonationConVo rcv = (CashDonationConVo) request.getAttribute("rcv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:800px;margin:0 auto;margin-top:100px;border-style:solid 1px;">
<div class="container">
	<div class="form-group">
		<h1>현금기부 상세 내역</h1>
	</div>
	<div class="form-group">
    	<label for="mname">기부자 이름 :</label>
		<input class="form-control" name="mname" id="mname" type="text" value="<%=rcv.getCidx() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
    	<label for="mpost">우편번호 :</label>
		<input class="form-control" name="mpost" id="mpost" type="text" value="<%=rcv.getMpost() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
	    <label for="maddr1">주소 :</label>
	    <input class="form-control" name="maddr1" id="maddr1" type="text" value="<%=rcv.getMaddr1() %>" readonly="readonly""/>
	</div>
	<div class="form-group">
	    <label for="maddr2">상세주소 :</label>
	    <input class="form-control" name="maddr2" id="maddr2" type="text" value="<%=rcv.getMaddr2() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="mbirth">생년월일 :</label>
	    <input class="form-control" name="mbirth" id="mbirth" type="text" value="<%=rcv.getMbirth() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="dlgroup1">분야1 :</label>
	    <input class="form-control" name="dlgroup1" id="dlgroup1" type="text" value="<%=rcv.getDlgroup1() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="dlgroup2">분야2 :</label>
	    <input class="form-control" name="dlgroup2" id="dlgroup2" type="text" value="<%=rcv.getDlgroup2() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="dlplace">기부처명 :</label>
	    <input class="form-control" name="dlplace" id="dlplace" type="text" value="<%=rcv.getDlplace() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="cmoney">기부금액 :</label>
	    <input class="form-control" name="cmoney" id="cmoney" type="text" value="<%=rcv.getCmoney() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="apdbate">기부날짜 :</label>
	    <input class="form-control" name="apdbate" id="apdbate" type="text" value="<%=rcv.getApdbdate() %>" readonly="readonly"/>
	 </div>
</div>
</body>
</html>