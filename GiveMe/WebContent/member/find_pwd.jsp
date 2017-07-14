<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function findValue(){
		if(!document.member.mid.value){
			alert("아이디를 입력하세요.");
			document.member.mid.focus();
			return false;
			
		}else if(!document.member.mname.value){
			alert("이름을 입력하세요.");
			document.member.mname.focus();
			return false;
			
		}else if(!document.member.mphone.value){
			alert("전화번호를 입력하세요.");
			document.member.mphone.focus();
			return false;	
		}
</script>
<style>
.panel-body{
	width:700px;
	height:300px;
	padding-left: 300px;
	margin-left: 280px;
}
label{
	padding-right: 240px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="wrap">
		<c:import url="/nav/header.jsp"/>
		<div class="panel-body">
		<form name="member" class="form-horizontal" method="post"  action="<%=request.getContextPath()%>/controller/MemberFindpwdServlet.do" onsubmit="retrun findValue()">
			<div class="form-group">
				<div class="mid">
				<label class="control-label" style="width:300px;">아이디</label>
				<input type="text" class="form-control" id="mid" name="mid"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="mname">
				<label class="control-label" style="width:300px;">이름</label>
				<input type="text" class="form-control" id="mname" name="mname"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="mphone">
				<label class="control-label" style="width:300px;">전화번호</label>
				<input type="text" class="form-control" id="mphone" name="mphone"/>
				</div>
			</div>
			
			<button type="submit" class="btn btn-default" style="float:right;">비밀번호 찾기</button>
			</form>
		</div>	
	<c:import url="/nav/footer.jsp"/>	
	</div>
</body>
</html>