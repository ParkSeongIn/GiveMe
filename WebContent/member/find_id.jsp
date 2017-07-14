<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	function findValue(){
		if(!document.member.mname.value){
			alert("이름을 입력하세요.");
			document.member.mname.focus();
			return false;
			
		}else if(!document.member.mphone.value){
			alert("전화번호를 입력하세요.");
			document.member.mphone.focus();
			return false;
		}
	}
</script>
<style>
	.panel-body{
		width:700px;
		height:300px;
		margin: auto;
	}
	div.footer.col-sm-7{
		padding-right: 65px;
	}
	form{
		padding-left: 100px;
	}
</style>
</head>
<body>
	<div class= "wrap">
		<c:import url="/nav/header.jsp"/>
		<div class="panel-body">
			<form name="member" class="form-horizontal" method="post"  action="<%=request.getContextPath()%>/controller/MemberFindidActionServlet.do" onsubmit="return findValue()">
				<div id="name">
					<div class="title col-sm-7">
						<label class="control-label">이름</label>
					</div>
							<br><br>
					<div class="input col-sm-6">	
						<input type="text" class="form-control" id=mname" name="mname"/>
					</div>
				</div>
						<br><br>
			
				<div id="phone">
					<div class="title col-sm-7">
						<label class="control-label">전화번호</label>
					</div>
							<br><br>
					<div class="input col-sm-6">	
						<input type="text" class="form-control" id="mphone" name="mphone"/>
					</div>
				</div>
					<br><br>
			
				<div class="row" style="margin-top:10px">
					<div class="col-sm-7"></div>
					<div class="footer col-sm-7">														
						<a href="<%=request.getContextPath()%>/controller/MainServlet.do" class="btn btn-default" style="float:right;" >취소</a>
						<button type="submit" class="btn btn-default" style="float:right;">확인</button>					
					</div>				
				</div>
				
			</form>
		</div>	
	</div>
		<br><br>
<c:import url="/nav/footer.jsp"/>

</body>
</html>