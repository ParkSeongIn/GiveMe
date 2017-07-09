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
	
	if(!document.member.pwd.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(document.member.pwd.value != document.member.pwdcheck.value){
		alert("비밀번호가 동일하지 않습니다.다시한번 입력해주세요.");
		return false;
	}	
	
	if(!document.member.phone.value){
		alert("통신사를 선택하세요.");
		return false;
	}
	
	if(!document.member.phone1.value){
		alert("전화번호 가운데 자리를 입력하세요.");
		return false;
	}
	
	if(!document.member.phone2.value){
		alert("전화번호 끝자리를 입력하세요.");
		return false;
	}
	
	if(!document.member.mail.value){
		alert("e-mail을 입력하세요.");
		return false;
	}
	
	if(!document.member.address.value){
		alert("우편번호를 입력하세요.");
		return false;
	}
	
	if(!document.member.addr1.value){
		alert("시군구 주소를 입력하세요.");
		return false;
	}
	
	if(!document.member.addr2.value){
		alert("나머지 주소를 입력하세요.");
		return false;
	}
	
}
</script>
<style>
.wrap{
	height: 600px;
}
</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<div id="wrap">
	<c:import url="/nav/header.jsp"/>
	<c:import url="/nav/sidebar5.jsp"/>
	<form method="post" action="<%=request.getContextPath()%>/controller/MemberModifyActionServlet.do" name="member" onsubmit="return checkValue()">
		<input type="hidden" name="midx" value="<%=vo.getMidx() %>">
		<table>		
			<tr>
				<td id="mid"> 아이디</td>
				<td>					
					<input type="text"	 name="mid" value="<%=vo.getMid() %>" disabled="disabled"/>				
				</td>
			</tr>
			
			<tr>
				<td id="mpwd"> 비밀번호 </td>
				<td>
					<input type="password" name="mpwd" maxlength="100" value="<%=vo.getMpwd()%>">
				</td>
			</tr>	
			
			<tr>
				<td> 비밀번호 확인 </td>
				<td>
					<input type="password" name="pwdcheck" maxlength="100">
				</td>
			</tr>		
			
			<tr>
				<td id="mname"> 이름 </td>
				<td>					
					<input type="text"	name="mname" value="<%=vo.getMname() %>" disabled="disabled"/>
				</td>
			</tr>
			
			<tr>
				<td id="mbirth"> 생년월일 </td>
				<td>					
					<input type="text"	name="mbirth" value="<%=vo.getMbirth() %>">										
				</td>
			</tr>
			
			<tr>
				<td id="mphone"> 핸드폰 번호</td>
				<td>
					<select name="mphone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="mphone1" maxlength="20"					
						value="<%=vo.getMphone() %>">
					
					<input type="text" name="mphone2" maxlength="20"
						value="<%=vo.getMphone()%>".substring(<%=vo.getMphone()%>.length()-4, 
							<%=vo.getMphone()%>.length())>

				</td>	
			</tr>
			
			<tr>
				<td id="mmail"> email</td>
				<td>
					<input type="text" name="mmail1" maxlength="100"
						value="<%=vo.getMmail() %>">
						@
					<select name=mmail>
						<option value="naver.com">네이버</option>
						<option value="hanmail.net">다음</option>
						<option value="google.com">구글</option>
						<option value="yahoo.com">야후</option>
						<option value="nate.com">네이트</option>						
					</select>
				</td>
			</tr>
			
			<tr>
				<td id="title">우편번호</td>
				<td>
					<input type="text" name="mpost" maxlength="20"
						value="<%=vo.getMpost()%>">
					<input type="button" value="우편번호 검색">
				</td>
			</tr>
			
			<tr>
				<td id="maddr1">주소1</td>
				<td>
					<input type="text" name="maddr1" maxlength="500"
						value="<%=vo.getMaddr1() %>">
				</td>
			</tr>
			
			<tr>
				<td id="maddr2">주소2</td>	
				<td>
					<input type="text" name="maddr2" maxlength="500"
						value="<%=vo.getMaddr2() %>">
				</td>
			</tr>
			
			<tr>
				<td id="mmdate">수정날짜</td>	
				<td>					
					<input type="text"	name="mmdate" value="<%=vo.getMmdate() %>" disabled="disabled"/>
				</td>
			</tr>
			
			<tr>
				<td id="title">탈퇴날짜</td>	
				<td>					
					<input type="text"	name="mbreakdate" value="<%=vo.getMbreakdate() %>" disabled="disabled"/>
				</td>
			</tr>
			
			<tr>
				<td id="mbreakdate">총 마일리지</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMpoint() %>" disabled="disabled"/>
				</td>
			</tr>
			
		</table>	
			<input class="btn btn-default"  type="reset" value="취소">
            <input class="btn btn-default"  type="submit" value="수정완료"/>		
	</form>
	</div>

<c:import url="/nav/footer.jsp"/>
</body>

</html>