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
		margin: auto;
	}
	div.input.col-sm-6{
		margin-bottom: 30px;
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
		
		<c:choose>
			<c:when test="${requestScope.mid == null || requestScope.mid == '' }">
			 <div class="panel panel-default">
			 	<div class="panel-heading">
			 		<h4>정보를 찾을 수 없음</h4>
			 	</div>
			 	<div class="panel-body">
			 		<p>입력하신 정보와 일치하는 정보를 찾을 수 없습니다</p>
			 		<a href="/controller/MemberFindidServlet.do" class="btn btn-default">아이디/비밀번호찾기</a>
			 	</div>
			 </div>
			</c:when>
			
			<c:otherwise>
				<div class="panel-body">
				<form name="member" class="form-horizontal" method="post"  action="<%=request.getContextPath()%>/controller/MemberChangePwdActServlet.do"  onsubmit="return changeValue()">
					<div id="newmpwd">
						<div class="title col-sm-7">				
							<label class="control-label1">변경할 비밀번호</label>
						</div>
						<div class="input col-sm-6">
							<input type="password" class="form-control" id="mpwd" name="mpwd"/>
						</div>				
					</div>
					
					<br><br><br>
										
					<div id="newmpwdcheck">
						<div class="title col-sm-7">	
							<label class="control-label2">변경할 비밀번호 확인</label>
						</div>
						<div class="input col-sm-6">
							<input type="password" class="form-control" id="newmpwdcheck" name="newmpwdcheck"/>
							<input type="hidden" name="mid" value="${requestScope.mid }"/>
						</div>
					</div>	
					
					<br><br>
					
					<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="footer col-sm-7">														
							<button type="button" class="btn btn-default" style="float:right;">취소</button>
							<button type="submit" class="btn btn-default" style="float:right;">변경하기</button>					
						</div>				
					</div>	
								
				</form>
				</div>		
			</c:otherwise>
		</c:choose>	
		<br>
		<c:import url="/nav/footer.jsp"/>	
	</div>


</body>
</html>