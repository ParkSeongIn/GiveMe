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
<title>ȸ������ ����</title>
<script>

function checkValue(){
	
	if(!document.member.pwd.value){
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	}
	
	if(document.member.pwd.value != document.member.pwdcheck.value){
		alert("��й�ȣ�� �������� �ʽ��ϴ�.�ٽ��ѹ� �Է����ּ���.");
		return false;
	}	
	
	if(!document.member.phone.value){
		alert("��Ż縦 �����ϼ���.");
		return false;
	}
	
	if(!document.member.phone1.value){
		alert("��ȭ��ȣ ��� �ڸ��� �Է��ϼ���.");
		return false;
	}
	
	if(!document.member.phone2.value){
		alert("��ȭ��ȣ ���ڸ��� �Է��ϼ���.");
		return false;
	}
	
	if(!document.member.mail.value){
		alert("e-mail�� �Է��ϼ���.");
		return false;
	}
	
	if(!document.member.address.value){
		alert("�����ȣ�� �Է��ϼ���.");
		return false;
	}
	
	if(!document.member.addr1.value){
		alert("�ñ��� �ּҸ� �Է��ϼ���.");
		return false;
	}
	
	if(!document.member.addr2.value){
		alert("������ �ּҸ� �Է��ϼ���.");
		return false;
	}
	
}
</script>

</head>
<body>

<div id="wrap">
	<br><br>
	ȸ������ ����(�̿��� �� ������)
	<br><br>
	
	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ��� -->
	<!-- �Ķ����(��) ������ post���, ������ �������� joinOk.jsp -->
	<form method="post" action="<%=request.getContextPath()%>/controller.member/MemberModifyActServlet.do" name="member" onsubmit="return checkValue()">
		<table>
			
			<tr>
				<td id="title"> ȸ����ȣ</td>
				<td>					
					<input type="text"	name="midx" value="<%=midx %>">				
				</td>
			</tr>
		
			<tr>
				<td id="title"> ȸ�����</td>
				<td>
					<input type="text" name="mgrade" maxlength="100"
						value="<%=vo.getMgrade() %>" readonly="readonly">										
				</td>
			</tr>			
			
			<tr>
				<td id="title"> ���̵�</td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMid() %>">				
				</td>
			</tr>
			
			<tr>
				<td id="title"> ��й�ȣ </td>
				<td>
					<input type="password" name="mpwd" maxlength="100"
						value="<%=vo.getMpwd()%>">
				</td>
			</tr>	
			
			<tr>
				<td> ��й�ȣ Ȯ�� </td>
				<td>
					<input type="password" name="pwdcheck" maxlength="100">
				</td>
			</tr>		
			
			<tr>
				<td id="title"> �̸� </td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMname() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title"> ������� </td>
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMbirth() %>">										
				</td>
			</tr>
			
			<tr>
				<td id="title"> �ڵ��� ��ȣ</td>
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
						<option value="naver.com">���̹�</option>
						<option value="hanmail.net">����</option>
						<option value="google.com">����</option>
						<option value="yahoo.com">����</option>
						<option value="nate.com">����Ʈ</option>						
					</select>
				</td>
			</tr>
			
			<tr>
				<td id="title">�����ȣ</td>
				<td>
					<input type="text" name="mpost" maxlength="20"
						value="<%=vo.getMpost()%>">
					<input type="button" value="�����ȣ �˻�">
				</td>
			</tr>
			
			<tr>
				<td id="title">�ּ�1</td>
				<td>
					<input type="text" name="maddr1" maxlength="500"
						value="<%=vo.getMaddr1() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title"m>�ּ�2</td>	
				<td>
					<input type="text" name="maddr2" maxlength="500"
						value="<%=vo.getMaddr2() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">������¥</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMmdate() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">Ż��¥</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMbreakdate() %>">
				</td>
			</tr>
			
			<tr>
				<td id="title">�� ���ϸ���</td>	
				<td>					
					<input type="text"	name="midx" value="<%=vo.getMpoint() %>">
				</td>
			</tr>
			
		</table>	
		<br>	
			<input type="reset" value="���">
            <input type="submit" value="����"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller.admin/MemberListServlet.do">�۸��</a>			
	</form>
</div>


</body>
</html>