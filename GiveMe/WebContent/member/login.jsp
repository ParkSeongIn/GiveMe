<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ������</title>
<% 
	request.setCharacterEncoding("UTF-8");		
%>

<script>
	//�α��� �� ���̵� �� ��й�ȣ �� �Է½� �˸� ���.
	function checkValue(){		
		
		if(!document.member.mid.value){
			alert("���̵� �Է��ϼ���.");
			document.member.mid.focus();
			return false;
			
		}else if(!document.member.mpwd.value){
			alert("��й�ȣ�� �Է��ϼ���.");
			document.member.mpwd.focus();
			return false;
		}		 
	}
	
	//ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵��ϴ� ���.
//	function letgojoin(){
//		location.href="join.jsp";
//	}
	
	//����ȭ�� ��ư Ŭ���� ����ȭ������ �̵��ϴ� ���.
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
					<td>���̵�</td>
					<td>
						<input type="text" name="mid" maxlength="100">
					</td>	
				</tr>
				
				<tr>
					<td>��й�ȣ</td>
					<td>
						<input type="password" name="mpwd" maxlength="100">						
					</td>
				</tr>					
			</table>	
			
			<input type="submit" value="�α���">									
		</form>	
		
	</div>
</body>
</html>