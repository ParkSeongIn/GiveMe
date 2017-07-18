<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
		//필수 입력 정보인 아이디 등 모든 정보가 입력되었는지 확인하는 함수
		function checkValue(){
			if(!document.member.mid.value){
				alert("아이디를 입력하세요.");
				return false;
			}else if((document.member.mid.value < "0" || document.member.mid.value > "9") && (document.member.mid.value < "A" || document.member.mid.value > "Z") && (document.member.mid.value < "a" || document.member.mid.value > "z")){
				alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
				return false;				
			}else if(document.member.mid.value.length<=6 || document.member.mid.value.length>=12){
				alert("아이디는 6자리 이상 12자리 이하입니다.");
				return false;				
			}else if(!document.member.mpwd.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if((document.member.mpwd.value < "0" || document.member.mpwd.value > "9") && (document.member.mpwd.value < "A" || document.member.mpwd.value > "Z") && (document.member.mpwd.value < "a" || document.member.mpwd.value > "z")){
				alert("한글 및 특수문자는 비밀번호로 사용하실 수 없습니다.");
				return false;
			}else if(document.member.mpwd.value.length <= 8 || document.member.mpwd.value.length >= 20){
				alert("비밀번호는 8자리 이상 20자리 이하입니다.");
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
			}else if(!document.member.mphone1.value || document.member.mphone1.value.length!=4){
				alert("전화번호 가운데 4자리를 입력하세요.");
				return false;
			}else if(!document.member.mphone2.value || document.member.mphone2.value.length!=4){
				alert("전화번호 끝자리 4자리를 입력하세요.");
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
			}else if(!isNaN(document.member.mbirth.value)){
				alert("년도는 숫자만 입력 가능합니다.");
				return false;	//true는 문자, false는 숫자.
			}else if(isNaN(document.member.mphone1.value)){
				alert("전화번호는 숫자만 입력 가능합니다.");
				return false;
			}else if(isNaN(document.member.mphone2.value)){
				alert("전화번호는 숫자만 입력 가능합니다.");
				return false;
			}			
		}
		
		//취소 버튼 클릭 시 로그인 화면으로 이동
		function goLogin(){
			location.href="<%=request.getContextPath()%>/controller/MemberCheckLoginServlet.do";
		}	
		
		//아이디 중복 체크 화면 open
		function checkid(){
			window.name="parentForm";
			window.open("<%=request.getContextPath()%>/member/check_id.jsp", "checkForm", "width=500, height=300");
		}
		
		//우편번호 찾기 화면 (주소1 포함) open
		function checkpost(){			
			new daum.Postcode({
				oncomplete: function(data){
					//팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
					
					document.getElementById('mpost1').value = data.postcode1;
					document.getElementById('mpost2').value = data.postcode2;
					document.getElementById('maddr1').value = data.address;
					document.getElementById('maddr2').focus();
					
				}
			}).open();
			
		}
		
		//아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅.
		//이유: 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록 하기 위함.
		function inputIdchk(){
			document.member.idDuplication.value="inUncheck";
		}		
	</script>
	
<style>
	div.container{				
		width:1135px;
		margin: auto;		
	}
	div.panel-body{
		width:1135px;
		margin: auto;				
	}	
	div.id.col-sm-4{
		margin-left: 1px;
		margin-right: -20px;
	}
	div.col-sm-2{
		display: inline-block;
	}
	div.select{
		width: 151px;
		height: 34px;				
	}
	div.title{
		width: 151px;
		height: 34px;
		display: inline-block;
	}
	select{
		height: 34px;
		width: 70px;
		margin-right: 30px;		
	}
	div.col-sm-4{
		margin-left:-48px;		
	}
	div.col-sm-3{
		margin-right:-20px;	
	}
	div.col-sm-2{
		margin-left: -10px;
	}
	div.mphone2.col-sm-2{
		margin-left:-15px;
	}
	div.post1.col-sm-2{
		margin-left: -15px;
	}
	div.post2.col-sm-2{
		margin-left: -60px;
	}
	#mmail2{
		width: 100px;
	}
	button{
		height: 50px;
	}

</style>

</head>
<body>
	<c:import url="/nav/header.jsp"/>
	<div class="container">	
	
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용 -->	
		<div class="panel panel-default">
		<h2>회원가입</h2>
		<div class="panel-body">
			<form method="post" class="form-horizontal" action="<%=request.getContextPath()%>/controller/MemberInsertActionServlet.do" name="member" onsubmit="return checkValue()">
				
				<div class="form-group">					
					<div class="col-sm-10">
						<label class="control-label">아이디</label>						
					</div>
					<div class="id col-sm-4">					
						<input type="text" class="form-control" name="mid" onkeydown="inputIdChk()">	
					</div>
					<div class="checkid col-sm-6">
						<input type="button" value="중복확인" onClick="checkid()">						
						<input type="hidden" name="idDuplication" value="idUncheck" >					
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">비밀번호</label>
						<input type="password" class="form-control" name="mpwd">											
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">비밀번호 확인</label>
						<input type="password" class="form-control" name="mpwdcheck">											
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">이름</label>
						<input type="text" class="form-control" name="mname">											
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">생년월일</label>
						<input type="text" class="form-control" name="mbirth">	예: YYYYMMDD(8자리)									
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-12">
						<label class="control-label">핸드폰번호</label>
					</div>	
						<div class="col-sm-1">	
							<select name="mphone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
						</div>	
						<div class="col-sm-2">									
						<input type="text" class="form-control" name="mphone1" >
						</div>
						<div class="mphone2 col-sm-2">
						<input type="text" class="form-control" name="mphone2" >
						</div>
					
				</div>
				
				<div class="form-group">
					<div class="col-sm-12">
						<label class="control-label">이메일</label>
					</div>
					<div class="col-sm-3">						
						<input type="text" class="form-control" name="mmail1">
					</div>
					<div class="col-sm-1">
					<h4>@</h4>
					</div>
									
					<div class="col-sm-4">											
							<select id="mmail2" name="mmail2">
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="google.com">google.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="nate.com">nate.com</option>						
							</select>							
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-3">
						<label class="control-label">우편번호</label>
					</div>
					<div class="col-sm-12">	
						<input type="button" value="우편번호 검색" onClick="checkpost()">
					</div>	
					<div class="way col-sm-6">					
						<div class="post1 col-sm-2">
							<input type="text" class="form-control" id="mpost1" name="mpost1">
						</div>
						<div class="connect col-sm-2">
						<h5>-</h5>
						</div>
						<div class="post2 col-sm-2">							
							<input type="text" class="form-control" id="mpost2" name="mpost2">
						</div>	
					</div>					
				</div>	
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">주소</label>
						<input type="text" class="form-control" id="maddr1" name="maddr1">																	
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">상세주소</label>
						<input type="text" class="form-control" id="maddr2" name="maddr2">																	
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label"></label>
						<input type="hidden" class="form-control" name="mgrade">																	
					</div>
				</div>	
				
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label"></label>
						<input type="hidden" class="form-control" name="mvalue">																	
					</div>
				</div>
									
				<div class="row" style="margin-top:10px">
					<div class="col-sm-7"></div>
					<div class="col-sm-3">
						<div>	
							<button type="submit" class="btn btn-default" style="float:right;">회원등록</button>
							<button type="button" class="btn btn-default" style="float:right;" onclick="goLogin()">취소</button>
						</div>
					</div>
				</div>
										
			</form>
		</div>		
		</div>
	</div>	
	
	<c:import url="/nav/footer.jsp"/>	
</body>
</html>
