<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.cashdonation.*" %>
<% 
	CashDonationVo cv = (CashDonationVo)request.getAttribute("cv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현금기부 confirm</title>
</head>
<body>
<div style="width:800px;margin:0 auto;margin-top:100px;">

<h1>현금기부 confirm</h1>
  <form id="addForm" action="<%=request.getContextPath()%>/controller/CashDonationInsertActionServlet.do" method="post">
        <div class="form-group">
            <label for="cway">현금기부 방식</label>
            <input class="form-control" name="cway" id="cway" type="text" value="${sessionScope.cv.cway }" readonly="readonly"/>
        </div>
  <div class="form-group">
            <label for="cmoney">현금기부 금액</label>
            <input class="form-control" name="cmoney" id="cmoney" type="text" value="${sessionScope.cv.cmoney }" readonly="readonly"/>
        </div>
         <div class="form-group">
            <label for="creceipt">현금기부 영수증</label>
            <input class="form-control" name="creceipt" id="creceipt" type="text" value="${sessionScope.cv.creceipt }" readonly="readonly"/>
        </div>
         <div class="form-group">
            <label for="cpaydate1">정기후원 출금일</label>
            <input class="form-control" name="cpaydate1" id="cpaydate1" type="text" value="${sessionScope.cv.cpaydate1 }" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="cstate">현금기부 상태</label>
            <input class="form-control" name="cstate" id="cstate" type="text" value="${sessionScope.cv.cstate }" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="cpoint">현금기부 마일리지</label>
            <input class="form-control" name="cpoint" id="cpoint" type="text" value="${sessionScope.cv.cpoint }" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="cpay">현금기부 결제방법</label>
            <input class="form-control" name="cpay" id="cpay" type="text" value="${sessionScope.cv.cpay }" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="capst">현금기부 결제 상태</label>
            <input class="form-control" name="capst" id="capst" type="text" value="${sessionScope.cv.capst }" readonly="readonly"/>
        </div>
          <div>
         	 <input class="btn btn-default" id="addButton" type="button" value="결제"/>
			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationInsertServlet.do">취소</a>        
        </div>
    </form>
</div>

</body>
</html>