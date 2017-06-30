<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 페이지</title>
<% 
	request.setCharacterEncoding("UTF-8");		
%>

<script>
	//로그인 시 아이디 및 비밀번호 미 입력시 알림 기능.
	function checkValue(){		
		
		if(!document.member.mid.value){
			alert("아이디를 입력하세요.");
			document.member.mid.focus();
			return false;
			
		}else if(!document.member.mpwd.value){
			alert("비밀번호를 입력하세요.");
			document.member.mpwd.focus();
			return false;
		}		 
	}
	
	//회원가입 버튼 클릭시 회원가입 화면으로 이동하는 기능.
//	function letgojoin(){
//		location.href="join.jsp";
//	}
	
	//메인화면 버튼 클릭시 메인화면으로 이동하는 기능.
//	function letgomain(){
//		a href="/WebContent/main/main.jsp";
//	}
</script>

</head>
<body>
	<div id = "wrap">
		<form name="member" method="post" 
			action="<%=request.getContextPath()%>/MemberCheckLoginServlet.do" onsubmit="return checkValue()">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="mid" maxlength="100">
					</td>	
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="mpwd" maxlength="100">						
					</td>
				</tr>					
			</table>	
			
			<input type="submit" value="로그인">									
		</form>	
		
	</div>
</body>
</html>