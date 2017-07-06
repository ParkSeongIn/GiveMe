<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.cashdonation.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후원하기</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
            } else if($('#cpaydate2').val()=='') {
                alert('입력하세요');
                $('#cpaydate2').focus();
            } else if($('#cstate').val()=='') {
                alert('입력하세요');
                $('#cstate').focus();
            } else if($('#cpoint').val()=='') {
                alert('입력하세요');
                $('#cpoint').focus();
            } else if($('#cdbdate').val()=='') {
                alert('입력하세요');
                $('#cdbdate').focus();
            } else if($('#cpay').val()=='') {
                alert('입력하세요');
                $('#cpay').focus();
            } else if($('#capst').val()=='') {
                alert('입력하세요');
                $('#capst').focus();
            }else {
                $('#addForm').submit();
            }
        });
    });
</script>
<title>현금기부 insert</title>
</head>
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
<div style="width: 700px; margin:0 auto;">
	<h3>현금기부 후원하기</h3>
    <form id="addForm" action="<%=request.getContextPath()%>/controller/CashDonationConfirmServlet.do" method="post">
        
        <div class="form-group">
            <label for="mid">아이디</label>
            <input class="form-control" name="mid" id="mid" type="text" value="${sessionScope.vo.mid }" disabled="disabled"/>
        </div>
        <div class="form-group">
            <label for="mid">idx</label>
            <input class="form-control" name="mid" id="mid" type="text" value="${sessionScope.vo.midx }" disabled="disabled"/>
        </div>
        <div class="form-group">
            <label for="cway">현금기부 방식</label>
            <input class="form-control" name="cway" id="cway" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cmoney">현금기부 금액</label>
            <input class="form-control" name="cmoney" id="cmoney" type="text" autocomplete="off"/>
        </div>
         <div class="form-group">
            <label for="cpaydate1">정기후원 출금일</label>
            <input class="form-control" name="cpaydate1" id="cpaydate1" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cstate">현금기부 상태</label>
            <input class="form-control" name="cstate" id="cstate" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cpoint">현금기부 마일리지</label>
            <input class="form-control" name="cpoint" id="cpoint" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cpay">현금기부 결제방법</label>
            <input class="form-control" name="cpay" id="cpay" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="capst">현금기부 결제 상태</label>
            <input class="form-control" name="capst" id="capst" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="creceipt">현금기부 영수증</label>
            <input class="form-control" name="creceipt" id="creceipt" type="text" autocomplete="off"/>
        </div>
          
          <div>
         	 <input class="btn btn-default" id="addButton" type="button" value="다음"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/main/main.jsp">취소</a>
        </div>
    </form>

</div>
<c:import url="/nav/footer.jsp"/>
</body>
</html>