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

function changeValue(){
	if(!document.member.mpwd.value){
		alert("새로운 비밀번호를 입력하세요.");
		document.member.mpwd.focus();
		return false;
		
	}else if(document.member.mpwd.value!=document.member.n_mpwdcheck.value){
		alert("새로운 비밀번호와 동일하게 입력하세요.");
		document.member.mpwdcheck.focus();
		return false;
	}	
}

</script>
<style>
.panel-body{
	width:700px;
	height:300px;
	padding-left: 300px;
	margin-left: 280px;
}
.control-label1{
	padding-right: 240px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<div class= "wrap">
		<c:import url="/nav/header.jsp"/>
		<c:choose>
		<c:when test="${requestScope.mid == null || requestScope.mid == '' }">
		 <div class="panel panel-default">
		 	<div class="panel-heading">
		 		<h4>정보를 찾을 수 없음</h4>
		 	</div>
		 	<div class="panel-body">
		 		<p>입력하신 정보와 일치하는 정보를 찾을 수 없습니다</p>
		 		<a href="/member/find_pwd.jsp" class="btn btn-default">아이디/비밀번호찾기</a>
		 	</div>
		 </div>
		</c:when>
		<c:otherwise>
		<div class="panel-body">
		<form name="member" class="form-horizontal" method="post"  action="<%=request.getContextPath()%>/controller/MemberChangePwdActServlet.do"  onsubmit="return changeValue()">
			<div class="form-group">
				<div class="mpwd">
				<label class="control-label1" style="width:300px;">패스워드</label>
				<input type="text" class="form-control" id="mpwd" name="mpwd"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="mpwdcheck">
				<label class="control-label2" style="width:350px;">패스워드확인</label>
				<input type="text" class="form-control" id="mpwdcheck" name="mpwdcheck"/>
				<input type="hidden" name="mid" value="${requestScope.mid }"/>
				</div>
			</div>
			
			<button type="button" class="btn btn-default" style="float:right;">취소</button>
			<button type="submit" class="btn btn-default" style="float:right;">변경하기</button>
		</form>
		</div>
		</c:otherwise>
		</c:choose>	
	<c:import url="/nav/footer.jsp"/>	
	</div>


</body>
</html>