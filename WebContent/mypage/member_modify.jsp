<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "service.member.MemberServiceImpl" %>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "common.Values" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
request.setCharacterEncoding("UTF-8");
int midx=(Integer)request.getAttribute("midx");
MemberVo vo = (MemberVo)request.getAttribute("vo");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

function checkValue(){
	
	if(!document.member.mpwd.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(document.member.mpwd.value != document.member.mpwdcheck.value){
		alert("비밀번호가 동일하지 않습니다.다시한번 입력해주세요.");
		return false;
	}	
	
	if(!document.member.mphone.value){
		alert("통신사를 선택하세요.");
		return false;
	}
	
	if(!document.member.mphone1.value){
		alert("전화번호 가운데 자리를 입력하세요.");
		return false;
	}
	
	if(!document.member.mphone2.value){
		alert("전화번호 끝자리를 입력하세요.");
		return false;
	}
	
	if(!document.member.mmail.value){
		alert("e-mail을 입력하세요.");
		return false;
	}
	
	if(!document.member.mpost.value){
		alert("우편번호를 입력하세요.");
		return false;
	}
	
	if(!document.member.maddr1.value){
		alert("시군구 주소를 입력하세요.");
		return false;
	}
	
	if(!document.member.maddr2.value){
		alert("나머지 주소를 입력하세요.");
		return false;
	}
	
}

//취소 버튼 클릭 시 로그인 화면으로 이동
function goLogin(){
	location.href="<%=request.getContextPath()%>/controller/MainServlet.do";
}	


</script>

<style>
	
	div.col-sm-4{
		float:left;
		padding-right: -50px;		
	}	
	div.input.col-sm-4{
		margin-left:-200px;
		margin-right: 25px;		
	}
	div.birth.col-sm-4{
		margin-left: 12px;
		margin-right: -201px;
	}
	div.name.col-sm-4{
		margin-left: 12px;
		margin-right: -213px;
	}	
	div.title.col-sm-3{
		margin-left: 12px;
		margin-right:-120px;
	}	
	select{
		height: 34px;
		width: 70px;
		margin-right: 50px;		
	}
	div.select.col-sm-3{
		margin-right: -155px;
		margin-left: -20px;
		padding-left: 50px;						
	}
	div.content2.col-sm-3{
		margin-left:-10px;
	}
	div.title.col-sm-1{
		margin-left: 12px;
		margin-right: 83px;	
	}
	div.at.col-sm-1{
		padding-left: -20px;
	}
	div.select.col-sm-6{		
		margin-left: -50px;								
	}
	#mmail2{
		width: 150px;
	}
	div.post.col-sm-3{
		margin-left: 12px;
		margin-right: -118px;		
	}
	div.post.col-sm-5{
		padding-left: 205px;			
	}
	div.addr.col-sm-3{
		margin-left: 12px;
		margin-right: -107px;
	}
	div.prim1.col-sm-3{
		margin-left: 12px;
		margin-right: -108px;
	}
	div.prim2.col-sm-3{
		margin-left: 12px;
		margin-right: -108px;
	}
	div.footer.col-sm-3{
		margin-right: -50px;
	}
	
</style>

</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
	<c:import url="/nav/header.jsp"/>
	<c:import url="/nav/sidebar5.jsp"/>
	<div class="container">
		<h2>내 정보 수정</h2>
			<br><br><br>
		<div class="body">	
			<form method="post" action="<%=request.getContextPath()%>/controller/MemberModifyActionServlet.do" name="member" onsubmit="return checkValue()">
				
				<input type="hidden" name="midx" value="<%=vo.getMidx() %>">
				
				
				<div class="col-sm-4">
					<label class="control-label">아이디</label>					
				</div>
				<div class="input col-sm-4">
					<input type="text" class="form-control" name="mid" value="<%=vo.getMid() %>" disabled="disabled"/>	
				</div>
				<br><br>						
				
				<div class="col-sm-4">
					<label  class="control-label">비밀번호</label>	
				</div>	
				<div class="input col-sm-4">	
					<input type="text" class="form-control" name="mpwd"/>	
				</div>	
				<br><br>
				
				<div class="col-sm-4">
					<label  class="control-label">비밀번호 확인</label>	
				</div>	
				<div class="input col-sm-4">	
					<input type="text" class="form-control" name="mpwdcheck"/>	
				</div>	
				<br><br>			
				
				<div class="name col-sm-4">
					<label  class="control-label">이름</label>	
				</div>	
				<div class="name col-sm-4">	
					<input type="text" class="form-control" name="mname" value="<%=vo.getMname() %>" disabled="disabled"/>	
				</div>	
				<br><br>			
				
				<div class="birth col-sm-4">
					<label  class="control-label">생년월일</label>	
				</div>	
				<div class="birth2 col-sm-4">	
					<input type="text" class="form-control" name="mbirth" value="<%=vo.getMbirth() %>" disabled="disabled"/>	
				</div>	
				<br><br>			
				
				<div class="title col-sm-3">
					<label class="control-label">핸드폰번호</label>
				</div>
				<div class="select col-sm-3">									
					<select id="mphone" name="mphone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
				</div>		
				<div class="content1 col-sm-3">									
					<input type="text" class="form-control" name="mphone1"value="<%=vo.getMphone() %>">
				</div>		
				<div class="content2 col-sm-3">
					<input type="text" class="form-control" name="mphone2" value="<%=vo.getMphone() %>">
				</div>
				<br><br>	
				
				<div class="title col-sm-1">
					<label class="control-label">이메일</label>
				</div>
				
				<div class="input col-sm-3">						
					<input type="text" class="form-control" name="mmail1" value="<%=vo.getMmail() %>">
				</div>
				
				<div class="at col-sm-1">
					<h4>@</h4>
				</div>
								
				<div class="select col-sm-6">											
					<select id="mmail2" name="mmail2">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="google.com">google.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="nate.com">nate.com</option>						
					</select>							
				</div>
				<br><br>
				
				<div class="post col-sm-3">
					<label class="control-label">우편번호</label>
				</div>
				<div class="post col-sm-3">										
					<input type="button" value="우편번호 검색">
				</div>
					<br><br>	
				<div class="post col-sm-5">
					<input type="text" class="form-control" name="mpost" value="<%=vo.getMpost()%>">
				</div>	
					<br><br>
				
				<div class="addr col-sm-3">
					<label class="control-label">주소</label>
				</div>
				<div class="addr1 col-sm-8">	
					<input type="text" class="form-control" name="maddr1" value="<%=vo.getMaddr1() %>">																	
				</div>
					<br><br>
			
				<div class="addr col-sm-3">
					<label class="control-label">상세주소</label>
				</div>
				<div class="addr2 col-sm-8">	
					<input type="text" class="form-control" name="maddr2" value="<%=vo.getMaddr2() %>">																	
				</div>
					<br><br>
				
				<div class="prim1 col-sm-3">				
					<label>가입날짜</label>
				</div>
				<div class="col-sm-3">		
					<input type="text" class="form-control" name="mmdate" value="<%=vo.getMmdate() %>" disabled="disabled"/>	
				</div>	
				
				<div class="prim1 col-sm-3">				
					<label>수정날짜</label>
				</div>
				<div class="col-sm-3">		
					<input type="text" class="form-control" name="mmdate" value="<%=vo.getMmdate() %>" disabled="disabled"/>	
				</div>							
					<br><br>
					
				<div class="prim2 col-sm-3">
					<label>탈퇴날짜</label>
				</div>	
				<div class="col-sm-3">		
					<input type="text" class="form-control" name="mbreakdate" value="<%=vo.getMbreakdate() %>" disabled="disabled"/>	
				</div>					
				
				<div class="prim1 col-sm-3">
					<label>총 마일리지</label>
				</div>
				<div class="col-sm-3">						
					<input type="text" class="form-control" name="mpoint" value="<%=vo.getMpoint() %>" disabled="disabled"/>	
				</div>				
					<br><br><br>
				
				<div class="row" style="margin-top:10px">
					<div class="col-sm-7"></div>
					<div class="footer col-sm-3">
						<div>
							<button type="button" class="btn btn-default" style="float:right;" onclick="goLogin()">취소</button>
		            		<button type="submit" class="btn btn-default" style="float:right;">수정완료</button>
						</div>	
					</div>
				</div>	
			</form>	
		</div>	<!-- body 끝 -->
	</div>			
	<br><br>
<c:import url="/nav/footer.jsp"/>

</body>

</html>