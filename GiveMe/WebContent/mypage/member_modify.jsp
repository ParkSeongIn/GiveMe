<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.member.MemberServiceImpl" %>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "common.Values" %>

<%
request.setCharacterEncoding("UTF-8");
int midx=(Integer)request.getAttribute("midx");
MemberVo vo = (MemberVo)request.getAttribute("vo");
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정</title>
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

</head>
<body>

<div id="wrap">
	<br><br>
	회원정보 수정(이용자 및 관리자)
	<br><br>
	
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용 -->
	<!-- 파라미터(값) 전송은 post방식, 전송할 페이지는 joinOk.jsp -->
	<form method="post" action="<%=request.getContextPath()%>/controller.member/MemberModifyActServlet.do" name="member" onsubmit="return checkValue()">
		<table>
			
			<tr>
				<td id="title"> 회원번호</td>
				<td>					
					<input type="text"	name="midx" value="<%=midx %>">				
				</td>
			</tr>
		
			<tr>
				<td id="title"> 회원등급</td>
				<td>
					<input type="text" name="mgrade" maxlength="100"
						value="<%=vo.getMgrade() %>" readonly="readonly">										
				</td>
			</tr>			
			
			<tr>
				<td id="title"> 아이디</td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMid() %>">				
				</td>
			</tr>
			
			<tr>
				<td id="title"> 비밀번호 </td>
				<td>
					<input type="password" name="mpwd" maxlength="100"
						value="<%=vo.getMpwd()%>">
				</td>
			</tr>	
			
			<tr>
				<td> 비밀번호 확인 </td>
				<td>
					<input type="password" name="pwdcheck" maxlength="100">
				</td>
			</tr>		
			
			<tr>
				<td id="title"> 이름 </td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMname() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 생년월일 </td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMbirth() %>">										
				</td>
			</tr>
			
			<tr>
				<td id="title"> 핸드폰 번호</td>
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
				<td id="title"> email</td>
				<td>
					<input type="text" name="mmail1" maxlength="100"
						value="<%=vo.getMmail() %>">
						@
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
				<td id="title">우편번호</td>
				<td>
					<input type="text" name="mpost" maxlength="20"
						value="<%=vo.getMpost()%>">
					<input type="button" value="우편번호 검색">
				</td>
			</tr>
			
			<tr>
				<td id="title">주소1</td>
				<td>
					<input type="text" name="maddr1" maxlength="500"
						value="<%=vo.getMaddr1() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title"m>주소2</td>	
				<td>
					<input type="text" name="maddr2" maxlength="500"
						value="<%=vo.getMaddr2() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">수정날짜</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMmdate() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">탈퇴날짜</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMbreakdate() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">총 마일리지</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMpoint() %>">
				</td>
			</tr>
			
		</table>	
		<br>	
			<input type="reset" value="취소">
            <input type="submit" value="수정"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller.admin/MemberListServlet.do">글목록</a>			
	</form>
</div>


</body>
</html>