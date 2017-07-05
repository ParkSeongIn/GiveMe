<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원가입</title>
<%-- 다음 주소 검색 라이브러리 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<c:url var="path" value="/js/daum_address.js"/>
<script src="${path }"></script>
<script>
		//필수 입력 정보인 아이디 등 모든 정보가 입력되었는지 확인하는 함수
		function checkValue(){
			if(!document.member.mid.value){
				alert("아이디를 입력하세요.");
				return false;
			}else if(!document.member.mpwd.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if(document.member.mpwd.value != document.member.mpwdcheck.value){
				alert("비밀번호가 동일하지 않습니다.다시한번 입력해주세요.");
				return false;
			}else if(!document.member.mname.value){
				alert("이름을 입력하세요.");
				return false;
			}else if(!document.member.mbirth.value){
				alert("생년월일을 입력하세요.");
				return false;
			}else if(document.member.mbirth.value.length!=8){
				alert("생년월일을 8자리에 맞춰 입력하세요.");
				return false;
			}else if(!document.member.mphone.value){
				alert("통신사를 선택하세요.");
				return false;
			}else if(!document.member.mphone1.value){
				alert("전화번호 가운데 자리를 입력하세요.");
				return false;
			}else if(!document.member.mphone2.value){
				alert("전화번호 끝자리를 입력하세요.");
				return false;
			}else if(!document.member.mmail.value){
				alert("e-mail을 입력하세요.");
				return false;
			}else if(!document.member.mpost.value){
				alert("우편번호를 입력하세요.");
				return false;
			}else if(!document.member.maddr1.value){
				alert("시군구 주소를 입력하세요.");
				return false;
			}else if(!document.member.maddr2.value){
				alert("나머지 주소를 입력하세요.");
				return false;
			}else if(isNaN(form.birth.value)){
				alert("년도는 숫자만 입력 가능합니다.");
				return false;	//true는 문자, false는 숫자.
			}
			
		}
		
		//취소 버튼 클릭 시 로그인 화면으로 이동
		function goLogin(){
			location.href="login.jsp";
		}	
		
		//아이디 중복 체크 화면 open
		function checkid(){
			window.name="parentForm";
			window.open("<%=request.getContextPath()%>/member/check_id.jsp", "checkForm", "width=500, height=300");
		}
		
		//아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅.
		//이유: 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록 하기 위함.
		function inputIdchk(){
			document.member.idDuplication.value="inUncheck";
		}
		
		
	</script>
<style>
.panel-body{
	width:900px;
	height:970px;
	padding-left: 300px;
	margin-left: 280px;
}
label{
	padding-right: 240px;
	margin-bottom: 10px;
}
.form-control{
	top: -36px;
    left: 101px;
}
.form-control{
	width:300px;
}
</style>

</head>
<body>

<div id="wrap">
	<c:import url="/nav/header.jsp"/>
	
	<div class="panel-body">
	<form method="post"  action="<%=request.getContextPath()%>/controller/MemberInsertActionServlet.do" name="member" onsubmit="return checkValue()">
		<div class="form-group">
				<label class="control-label" for="mid">아이디</label>
					<input type="text" name="mid" maxlength="100" onkeydown="inputIdChk()">
						
					<input type="button" value="중복확인" onClick="checkid()">
					<input type="hidden" name="idDuplication" value="idUncheck" >
				
		</div>
		
			<div class="form-group">
				<label class="control-label" for="mpwd">비밀번호</label>
					<input type="password" class="form-control" id="mpwd" name="mpwd"/>
				
			</div>
			<div class="form-group">
				<label class="control-label" for="mpwdcheck" style="padding-rigth:40px;">비밀번호 확인</label>
				
					<input type="password" class="form-control" id="mpwdcheck" name="mpwdcheck"/>
				
			</div>
			<div class="form-group">
				<label class="control-label" for="mname">이름</label>
				
					<input type="text" class="form-control" id="mname" name="mname"/>
			
			</div>
			<div class="form-group">
				<label class="control-label" for="mbirth">생년월일</label>
				
					<input type="text" class="form-control" id="mbirth" name="mbirth"/>예: YYYYMMDD(8자리)
			
			</div>
				
			<div class="form-group">
				<label class="control-label" for="mphone">핸드폰 번호</label>
				<select name="mphone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<input type="text" class="form-control" name="mphone1" maxlength="20">
					<input type="text" class="form-control" name="mphone2" maxlength="20">
			</div>
			<div class="form-group">
				<label class="control-label" for="mmail1">E-mail</label>
				<input type="text" class="form-control" name="mphone1" maxlength="20">@
				<select name=mmail2>
						<option value="naver.com">네이버</option>
						<option value="hanmail.net">다음</option>
						<option value="google.com">구글</option>
						<option value="yahoo.com">야후</option>
						<option value="nate.com">네이트</option>						
					</select>
			</div>
			
			<div class="form-group">
				<label class="control-label" for="mpost">우편번호</label>
		
					<input type="text" class="form-control" id="mpost" name="mpost"/>
					<button type="button" onclick="show_address_box()">주소 검색</button>
				
			</div>
			
			<div class="form-group">
				<label class="control-label" for="maddr1">주소1</label>
				
					<input type="text" class="form-control" id="maddr1" name="maddr1"/>
				
			</div>
			<div class="form-group">
				<label class="control-label" for="maddr2">주소2</label>
			
					<input type="text" class="form-control" id="maddr2" name="maddr2"/>
			
			</div>
			
			
			<input type="submit"  class="btn btn-default" value="회원등록">
			<input type="button" class="btn btn-default"  value="취소" onclick="goLogin()">
	</form>
</div>

</div>

<c:import url="/nav/footer.jsp"/>	
</body>
</html>