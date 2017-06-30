<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>


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
</head>
<body>

<div id = "wrap">
		<form name="member" method="post" 
			action="<%=request.getContextPath()%>/MemberFindidServlet.do" onsubmit="return findValue()">
			<table>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="mname" maxlength="100">
					</td>	
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="mphone" maxlength="100">						
					</td>
				</tr>					
			</table>	
			
			<input type="submit" value="아이디 찾기">									
		</form>	
		
	</div>

</body>
</html>