<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="service.talentboard.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");
int tbidx = (Integer)request.getAttribute("tbidx");
TalentBoardVo tv = (TalentBoardVo)request.getAttribute("tv");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능기부 수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
        $('#ModifyButton').click(function(){ 
        	 if($('#tbcategory1').val().length <1) { 
                alert('카테고리를 선택하세요');
                $('#tbcategory1').focus(); 
            } else if($('#tbcategory2').val().length <1) { 
                alert('상세 카테고리를 선택하세요');
                $('#tbcategory2').focus(); 
            } else if($('#tbtitle').val().length <1) { 
                alert('제목을 입력하세요');
                $('#tbtitle').focus(); 
            } else if($('#tbhdate').val()=='') { 
                alert('희망 날짜를 입력하세요');
                $('#tbhdate').focus();
            } else if($('#tbtime').val()=='') { 
                alert('희망 시간를 입력하세요');
                $('#tbtime').focus();
            } else if($('#tbpeoplecnt').val()=='') { 
                alert('희망 인원을 입력해 주세요.');
                $('#tbpeoplecnt').focus();
            } else if($('#tbarea1').val()=='') { 
                alert('희망 지역를 입력하세요');
                $('#tbarea1').focus();
            } else if($('#tbarea2').val()=='') { 
                alert('희망 날짜를 입력하세요');
                $('#tbarea2').focus();
            } else if($('#tbcontent').val()=='') { 
                alert('내용을 입력하세요');
                $('#tbcontent').focus();
            } else {
                $('#ModifyForm').submit();
            }
        });
    });

</script>
<style>
.total_group {
	width:700px;
	float:right;
}
.form-group1, .form-group2, .form-group3, .form-group4, .form-group5, .form-group6 {
	width:300px;
}
.bottom{
	float:right;
}


</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
<div class="container">
	<h1>재능기부 수정</h1>
	<div class="total_group">
		<form id="ModifyForm" action="<%=request.getContextPath()%>/controller/TalentBoardModifyActionServlet.do" method="post">
        <div class="form-group1">
            <label for="tbidx">글번호 : ${tbidx}</label>
			<input class="form-control" name="tbidx" id="tbidx" type="hidden" value="${tbidx}"/>
        </div><br/>
	        
        <div class="form-group2">
            <label for="tbpeople">작성자 분류 : ${tv.tbpeople} </label>
			<input class="form-control" name="tbpeople" id="tbpeople" type="hidden" value="${tv.tbpeople}"/>
        </div><br/>
        
        <div class="form-group3">
	    	<label for="tbcategory1">분류1 :</label>
			<input class="form-control" name="tbcategory1" id="tbcategory1" type="text" value="${tv.tbcategory1}"/>
		</div>
			
		<div class="form-group3">
	    	<label for="tbcategory2">분류2 :</label>
			<input class="form-control" name="tbcategory2" id="tbcategory2" type="text" value="${tv.tbcategory2}"/>
		</div>
			
		<div class="form-group4">
	    	<label for="tbtitle">제목 :</label>
			<input class="form-control" name="tbtitle" id="tbtitle" type="text" value="${tv.tbtitle}"/>
		</div>
			
		<div class="form-group5">
	    	<label for="tbhdate">희망 날짜 :</label>
			<input class="form-control" name="tbhdate" id="tbhdate" type="text" value="${tv.tbhdate}"/>
		</div>

		<div class="form-group6">
	    	<label for="tbtime">희망 시간 :</label>
			<input class="form-control" name="tbtime" id="tbtime" type="text" value="${tv.tbtime}"/>
		</div>
		<br/>

        <div class="form-group6">
			<label for="tbpeoplecnt">희망 인원 :</label>
			<input class="form-control" name="tbpeoplecnt" id="tbpeoplecnt" type="text" value="${tv.tbpeoplecnt}"/>
		</div>
		
		<div class="form-group6">
			<label for="tbarea1">지역1 :</label>
			<input class="form-control" name="tbarea1" id="tbarea1" type="text" value="${tv.tbarea1}"/>
		</div>
		<div class="form-group6">
			<label for="tbarea2">지역2 :</label>
			<input class="form-control" name="tbarea2" id="tbarea2" type="text" value="${tv.tbarea2}"/>
		</div>
		
		<c:if test = "${tv.tbpeople == '제공자'}">
	    <div class="form-group6">
			<label for="tbfile">파일 첨부 :</label>
			<input class="form-control" name="tbfile" id="tbfile" type="text" value="${tv.tbfile}"/>
		</div>
		</c:if>
		
		<div class="form-group7">
        	<label for="tbcontent">내용 :</label>
        	<textarea name="tbcontent" id="tbcontent" rows="10" cols="100">${tv.tbcontent}</textarea>
        </div>
        <br/>
        
        <div class="bottom">
            <input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardListServlet.do">글목록</a>
        </div>
        </form>
    </div>   
 </div>
 <c:import url="/nav/footer.jsp"/>
</body>
</html>
