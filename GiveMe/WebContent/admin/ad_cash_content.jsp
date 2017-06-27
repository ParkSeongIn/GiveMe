<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.admin.*" %>
<% 
	CashDonationConVo gcv = (CashDonationConVo) request.getAttribute("gcv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 현금 기부 상세 내역</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" >
</script>
</head>
<body>
<div class="container">
	<div class="form-group">
		<h1>현금기부 상세 내역</h1>
	</div>
	<div class="form-group">
    	<label for="cidx">cidx :</label>
		<input class="form-control" name="cidx" id="cidx" type="text" value="<%=gcv.getCidx() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
    	<label for="midx">midx :</label>
		<input class="form-control" name="mdx" id="midx" type="text" value="<%=gcv.getMidx() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
	    <label for="mname">mname :</label>
	    <input class="form-control" name="mname" id="mname" type="text" value="<%=gcv.getMname() %>" readonly="readonly""/>
	</div>
	<div class="form-group">
	    <label for="cway">cway :</label>
	    <input class="form-control" name="cway" id="cway" type="text" value="<%=gcv.getCway() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="cpaydate1">cpaydate1 :</label>
	    <input class="form-control" name="cpaydate1" id="cpaydate1" type="text" value="<%=gcv.getCpaydate1() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="dlgroup1">dlgroup1 :</label>
	    <input class="form-control" name="dlgroup1" id="dlgroup1" type="text" value="<%=gcv.getDlgroup1() %>" readonly="readonly"/>
	 </div>
	 <div class="form-group">
	    <label for="dlgroup2">dlgroup2 :</label>
	    <input class="form-control" name="dlgroup1" id="dlgroup1" type="text" value="<%=gcv.getDlgroup2() %>" readonly="readonly"/>
	 </div>
		<div class="form-group">
	    <label for="dlplace">dlplace :</label>
	    <input class="form-control" name="dlplace" id="dlplace" type="text" value="<%=gcv.getDlplace() %>" readonly="readonly"/>
	 </div>
		<div class="form-group">
	    <label for="cmoney">cmoney :</label>
	    <input class="form-control" name="cmoney" id="cmoney" type="text" value="<%=gcv.getCmoney() %>" readonly="readonly"/>
	 </div>
		<div class="form-group">
	    <label for="apdbdate">apdbdate :</label>
	    <input class="form-control" name="apdbdate" id="apdbdate" type="text" value="<%=gcv.getApdbdate() %>" readonly="readonly"/>
	 </div>
		<div class="form-group">
	    <label for="apstate">apstate :</label>
	    <input class="form-control" name="apstate" id="apstate" type="text" value="<%=gcv.getApstate() %>" readonly="readonly"/>
	 </div>
		<div class="form-group">
	    <label for="cpay">cpay :</label>
	    <input class="form-control" name="cpay" id="cpay" type="text" value="<%=gcv.getCpay() %>" readonly="readonly"/>
	 </div>
	<div>
	 	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationListServlet.do">글목록</a>
	</div>        
</div>

</body>
</html>