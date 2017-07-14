<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
request.setCharacterEncoding("UTF-8");
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복확인</title>

<script>

//	function checkidClose(sid){
//		opener.member.mid.value=sid;
//		window.close();
//		opener.member.mpwd.focus();
//	}

	var httpRequest = null;
	
	// httpRequest 객체 생성
    function getXMLHttpRequest(){
        var httpRequest = null;
    
        if(window.ActiveXObject){
            try{
                httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
            } catch(e) {
                try{
                    httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e2) { httpRequest = null; }
            }
        }
        else if(window.XMLHttpRequest){
            httpRequest = new window.XMLHttpRequest();
        }
        return httpRequest;    
    }
	
	//회원가입창의 아이디 입력란의 값을 가져오는 기능.
	function pValue(){
		document.getElementById("userId").value=opener.document.member.mid.value;
	}
	
	//아이디 중복체크 기능.
	function idCheck(){
		
		var mid = document.getElementById("userId").value;
		
		if(!mid){
			alert("아이디를 입력하지 않았습니다");
			return false;

		}
		else if((mid < "0" || mid > "9") && (mid < "A" || mid > "Z") && (mid < "a" || mid > "z")){
			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
			return false;
		}else{
			var param="mid="+mid
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = callback;
            httpRequest.open("POST", "/GiveMe/MemberCheckidActionServlet", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            httpRequest.send(param);
        }
	}
	
	//
	function callback(){
	
		if(httpRequest.readyState == 4){
			
			//결과값을 가져옴.
			var resultText = httpRequest.responseText;
			if(resultText == 0){	//중복된 아이디가 있는 것.
				alert("사용할 수 없는 아이디입니다");
				document.getElementById("cancleBtn").style.visibility = 'visible';
				document.getElementById("useBtn").style.visibility = 'hidden';
				document.getElementById("msg").innerHTML = "";
				
			}else if(resultText == 1){	//입력 가능한 아이디.
				document.getElementById("cancleBtn").style.visibility = 'hidden';
				document.getElementById("useBtn").style.visibility = 'visible';
				document.getElementById("msg").innerHTML = "사용 가능한 아이디 입니다.";				
			}
		}
	}
	
	//사용하기 클릭 시 부모창으로 값 전달.
	function sendCheckValue(){
		//중복체크 결과인 idCheck 값을 전달한다. 
		opener.document.member.idDuplication.value="idCheck";
		//회원가입 화면의 ID입력란에 값을 전달.
		opener.document.member.mid.value=document.getElementById("userId").value;
		
		if(opener !=null){
			opener.check_id=null;
			self.close();
		}
	}

</script>

</head>
<body onload = "pValue()">
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		
		<div class="checkid">
			<form class="checkform">
				<input type="text" name="mid" id="userId">
				<input type="button" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br>
			
			<input id="cancleBtn" type="button" value="취소" onclick="window.close()">
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">		
		</div>	
	</div>

</body>
</html>