<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="service.admin.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기부처 리스트 내용</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.image {
	width:300px;
	position:absolute;
}
img {
	width:400px; 
	height:400px;
}
.total_group {
	width:700px;
	float:right;
}
.form-group1, .form-group2{
	width:300px;
}
.bottom{
	float:right;
}
.form-group3{
	width:150px;
}


</style>
</head>
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
	<h1>기부처 리스트 내용</h1>
<%
DonationListVo vo = (DonationListVo)request.getAttribute("vo");
int dlidx = (Integer)request.getAttribute("dlidx");
%>
	<input type="hidden" name="dlidx" value="${vo.dlidx}"/>	
	<div class="image">
		<c:url var="path" value="/upload"/>
		<img src="${path }/${vo.dlimage }">
	</div>
	
	<div class="total_group">
        <div class="form-group1">
            <label for="dlplace">기부처 :</label>
            <input class="form-control" name="dlplace" id="dlplace" type="text" value="${vo.dlplace}" disabled="disabled"/>
        </div><br/>
	        
        <div class="form-group2">
            <label for="dlarea">지역 :</label>
            <input class="form-control" name="dlarea" id="dlarea" type="text" value="${vo.dlarea}" disabled="disabled"/>
        </div><br/>
        
        	<div class="form-group3">
	    		<label for="dlgroup1"></label>
	    		<input class="form-control" name="dlgroup1" id="dlgroup1" type="text" value="${vo.dlgroup1}" disabled="disabled"/>
			</div>
			
			<div class="form-group3">
	    		<label for="dlgroup2"></label>
	    		<input class="form-control" name="dlgroup2" id="dlgroup2" type="text" value="${vo.dlgroup2}" disabled="disabled"/>
			</div>
			<br/>
        
        <div class="form-group4">
        	<label for="dlcontent">내용 :</label>
        	<textarea name="dlcontent" id="dlcontent" rows="10" cols="100"  disabled="disabled">${vo.dlcontent}</textarea>
        </div>
        <br/>
        
        <div class="bottom">
            <a class="btn btn-default"  href="${ContextPath }/controller/DonationModifyServlet.do?dlidx=${vo.dlidx}">수정</a>
            <a class="btn btn-default" href="#" onclick="deleteCon()">삭제</a>
            <a class="btn btn-default" href="${ContextPath }/controller/DonationListServlet.do">글목록</a>
        </div>
        
        </div>
 </div>
 <script>
function deleteCon(){
 	if(confirm("삭제하시겠습니까?") == true){
		location.href="DonationDeleteServlet.do?dlidx=<%=dlidx%>";
  	}else{
	  alert("취소되었습니다.");
  	}
 }
</script>
</body>
</html>
