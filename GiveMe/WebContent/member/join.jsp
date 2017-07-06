<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

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
			location.href="<%=request.getContextPath()%>/controller/MemberCheckLoginServlet.do";
		}	
		
		//아이디 중복 체크 화면 open
		function checkid(){
			window.name="parentForm";
			window.open("check_id.jsp", "checkForm", "width=500, height=300");
		}
		
		//아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅.
		//이유: 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록 하기 위함.
		function inputIdchk(){
			document.member.idDuplication.value="inUncheck";
		}
		
		
	</script>


</head>
<body>

<div id="wrap">
	<br><br>
	회원가입
	<br><br>
	
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용 -->
	<!-- 파라미터(값) 전송은 post방식, 전송할 페이지는 joinOk.jsp -->
	<form method="post" action="<%=request.getContextPath()%>/controller/MemberInsertActionServlet.do" name="member" onsubmit="return checkValue()">
		<table>
			<tr>
				<td> 아이디</td>
				<td>
					<input type="text" name="mid" maxlength="100" onkeydown="inputIdChk()">					
					<input type="button" value="중복확인" onClick="checkid()">
					<input type="hidden" name="idDuplication" value="idUncheck" >


				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>
					<input type="password" name="mpwd" maxlength="100">
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 확인 </td>
				<td>
					<input type="password" name="mpwdcheck" maxlength="100">
				</td>
			</tr>
			
			<tr>
				<td> 이름 </td>
				<td>
					<input type="text" name="mname" maxlength="100">
				</td>
			</tr>
			
			<tr>
				<td> 생년월일 </td>
				<td>
					<input type="text" name="mbirth" maxlength="100">예: YYYYMMDD(8자리)					
				</td>
			</tr>				
			
			<tr>
				<td> 핸드폰 번호</td>
				<td>
					<select name="mphone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="mphone1" maxlength="20">
					<input type="text" name="mphone2" maxlength="20">
				</td>	
			</tr>
			
			<tr>
				<td> E-mail</td>
				<td>
					<input type="text" name="mmail1" maxlength="100">@
					<select name=mmail2>
						<option value="naver.com">네이버</option>
						<option value="hanmail.net">다음</option>
						<option value="google.com">구글</option>
						<option value="yahoo.com">야후</option>
						<option value="nate.com">네이트</option>						
					</select>
				</td>
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="mpost" maxlength="20">
					<input type="button" value="우편번호 검색">
				</td>
			</tr>
			
			<tr>
				<td>주소1</td>
				<td>
					<input type="text" name="maddr1" maxlength="500">
				</td>
			</tr>
			
			<tr>
				<td>주소2</td>	
				<td>
					<input type="text" name="maddr2" maxlength="500">
				</td>
			</tr>
			
			<tr>
				<td></td>	
				<td>
					<input type="hidden" name="mgrade" maxlength="500">
				</td>
			</tr>
			
			<tr>
				<td></td>	
				<td>
					<input type="hidden" name="mvalue" maxlength="500">
				</td>
			</tr>
			
			
		</table>	
		<br>	
			<input type="submit" value="회원등록"><input type="button" value="취소" onclick="goLogin()">
	</form>
</div>

</body>
</html>

<c:import url="/nav/footer.jsp"/>	