<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.member.MemberServiceImpl" %>  
<%@ page import = "common.Values" %>  
    
<%
	request.setCharacterEncoding("UTF-8");
	MemberVo vo = (MemberVo)request.getAttribute("vo");
	int midx = (Integer)request.getAttribute("midx");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ Content</title>

</head>
<body>

<div id="wrap">
	<br><br>
	ȸ������ Content(�̿��� �� ������-���ǿ� ���� �޸� ��Ÿ���� ��)
	<br><br>
	
	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ��� -->
	<!-- �Ķ����(��) ������ post���, ������ �������� joinOk.jsp -->
	
		<table>
		<div class="admin">
 
			<tr>
				<td> ȸ�����</td>
				<td>
					<%=vo.getMgrade() %>																
				</td>
			</tr>
			
			<tr>
				<td> ȸ����ȣ</td>
				<td>					 
					<%=vo.getMidx() %>				
				</td>
			</tr>
			
			<tr>
				<td> ���̵�</td>
				<td>					
					<%=vo.getMid() %>				
				</td>
			</tr>
			
			<tr>
				<td> ��й�ȣ </td>
				<td>				
					<%=vo.getMpwd()%>
				</td>
			</tr>			
			
			<tr>
				<td> �̸� </td>
				<td>
					<%=vo.getMname() %>
				</td>
			</tr>
			
			<tr>
				<td> ������� </td>
				<td>
					<%=vo.getMbirth() %>					
				</td>
			</tr>
			
			<tr>
				<td> �ڵ��� ��ȣ</td>
				<td>							
					<%=vo.getMphone() %>				
				</td>	
			</tr>
			
			<tr>
				<td> email</td>
				<td>
					<%=vo.getMmail() %>					
				</td>
			</tr>
			
			<tr>
				<td>�����ȣ</td>
				<td>				
					<%=vo.getMpost()%>				
				</td>
			</tr>
			
			<tr>
				<td>�ּ�1</td>
				<td>					
					<%=vo.getMaddr1() %>
				</td>
			</tr>
			
			<tr>
				<td>�ּ�2</td>	
				<td>					
					<%=vo.getMaddr2() %>
				</td>
			</tr>			
			
			<tr>
				<td>���Գ�¥</td>	
				<td>					
					<%=vo.getMenter() %>
				</td>
			</tr>
			
			<tr>
				<td>������¥</td>	
				<td>					
					<%=vo.getMmdate() %>
				</td>
			</tr>
			
			<tr>
				<td>Ż��¥</td>	
				<td>					
					<%=vo.getMbreakdate() %>
				</td>
			</tr>
			
			<tr>
				<td>�� ���ϸ���</td>	
				<td>					
					<%=vo.getMpoint() %>
				</td>
			</tr>
			
			<div>			
	  			<input class="btn btn-default" id="DeleteButton" type="button" value="Ż��" onclick="de()"/>
	  			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller.member/MemberModifyServlet.do?midx=<%=midx %>">����</a>	  			
	  			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/MemberListServlet.do">���</a>
  			</div>	
  		
		</div>
<!-- 		
		<div class="guest">
			<tr>
				<td> ���̵�</td>
				<td>					
								
				</td>
			</tr>
			
			<tr>
				<td> ��й�ȣ </td>
				<td>
					<input type="password" name="pwd" maxlength="100"
						
				</td>
			</tr>			
			
			<tr>
				<td> �̸� </td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<td> ������� </td>
				<td>
								
				</td>
			</tr>
			
			<tr>
				<td> �ڵ��� ��ȣ</td>
				<td>
					<input type="text" name="phone1" maxlength="20"					
						value=>				
				</td>	
			</tr>
			
			<tr>
				<td> email</td>
				<td>
					<input type="text" name="mail1" maxlength="100"
						value=>					
				</td>
			</tr>
			
			<tr>
				<td>�����ȣ</td>
				<td>
					<input type="text" name="post" maxlength="20"
						value=>
					<input type="button" value="�����ȣ �˻�">
				</td>
			</tr>
			
			<tr>
				<td>�ּ�1</td>
				<td>
					<input type="text" name="addr1" maxlength="500"
						value=>
				</td>
			</tr>
			
			<tr>
				<td>�ּ�2</td>	
				<td>
					<input type="text" name="addr2" maxlength="500"
						value=>
				</td>
			</tr>			
			
			<tr>
				<td>�� ���ϸ���</td>	
				<td>
					<input type="text" name="mpoint" maxlength="500"
						>
				</td>
			</tr>
			
		</div>	
 -->		
		</table>	
		<br>				
	
</div>



</body>
</html>