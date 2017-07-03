<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	//로그인 시 아이디 및 비밀번호 미 입력시 알림 기능.
	function chkSubmit(){
		var f = document.forms.member;
		document.domain = "your domain";
		opener.name = "openerNames";
		f.target = opener.name;
		f.action = "<%=request.getContextPath()%>/controller/MemberCheckLoginActionServlet.do";
		f.submit();
		self.close();
		
	}
	
	function chkValue(){
		if(!document.member.mid.value){
			alert("아이디를 입력하세요.");
			document.member.mid.focus();
			return false;
		}else if(!document.member.mpwd.value){
			alert("비밀번호를 입력하세요.");
			document.member.mpwd.focus();
			return false;
		}else{
			member.submit();
			return true;	
		}
	}
	
	</script>

</head>
<body>
	<div class= "wrap">
		<form name="member" method="post"  action="<%=request.getContextPath()%>/controller/MemberCheckLoginActionServlet.do">
			<div class="panel panel-default">
				<div class="id">
				<label class="control-label">아이디</label>
				<input type="text" class="form-control" id="mid" name="mid"/>
				</div>
				
				<div class="pw">
				<label class="control-label">비밀번호</label>
				<input type="text" class="form-control" id="mpwd" name="mpwd"/>
				</div>
			</div>
			<button type="button" class="btn btn-default" style="float:right;" onclick="chkSubmit()">로그인</button>									
		</form>	
		
	</div>
</body>
</html>