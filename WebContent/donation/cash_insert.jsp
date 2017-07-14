<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="service.cashdonation.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현금기부 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
select{
	width :200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
select::-ms-expand { /* for IE 11 */
    display: none;
}
</style>

<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
    	$('#cway').change(function(){
			if( $('#cway option:selected').val() =='일시후원' ){
				$('#cpaydate1').hide();
	        }else{
				$('#cpaydate1').show();
	        }
			
	    });
    });
</script>

</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
	<div class="container" style="margin-top:80px">
		<div class="panel panel-default">
			<h2>현금기부</h2>
			<div class="panel-body">
			<form id="addForm" action="${ContextPath}/controller/CashDonationInsertActionServlet.do" method="post">
				<div class="form-horizontal">
					<%-- 이 양식과 똑같이 하나하나 추가 --%>
					<div class="form-group">
						<label class="control-label col-sm-3" for="cway">후원방식</label>
						<select id="cway" name="cway">
		    			<option value="정기후원" >정기후원</option>
		    			<option value="일시후원" >일시후원</option>
						</select>
					</div>
					
					<div class="form-group" id="cpaydate1">
						<label class="control-label col-sm-3" for="cpaydate1">출금일</label>
						<select id="cpaydate1" name="cpaydate1">
		    			<option value="10">월 10일</option>
		    			<option value="20">월 20일</option>
		    			<option value="30">월 30일</option>
						</select>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="cmoney">후원금액</label>
						<select id="cmoney" name="cmoney">
		    			<option value="10000" >1만원</option>
		    			<option value="50000" >5만원</option>
		    			<option value="100000" >10만원</option>
						</select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="cpay">결제방법</label>
						<select id="cpay" name="cpay" >
		    			<option value="신용카드" >신용카드</option>
		    			<option value="핸드폰결제" >핸드폰결제</option>
		    			<option value="계좌이체" >계좌이체</option>
						</select>
						
					</div>
					
					<label class="control-label col-sm-3" for="creceipt">영수증발급</label>
						<select id="creceipt" name="creceipt">
		    			<option value="Y" >예</option>
		    			<option value="N" >아니오</option>
						</select>
					<input type="hidden" name="cpoint" id="cpoint" value=0>
					
					<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="col-sm-3">
							<div>
         					 <input class="btn btn-default" id="addButton" type="button" value="결제" />
            					<a class="btn btn-default" href="${ContextPath}/controller/MainServlet.do">취소</a>
        					</div>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
<c:import url="/nav/footer.jsp"/>
<script>
$('#addButton').click(function(){
    if(confirm("결제하시겠습니까?") == true) {
    	location.href="CashDonationInsertActionServlet.do";
		$('#addForm').submit();
    }else{
    	alert("취소되었습니다.")
    	location.href="MainServlet.do";
    }
    
    
});
</script>	
</body>
</html>