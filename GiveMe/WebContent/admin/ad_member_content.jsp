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
<title>회원정보 Content</title>

</head>
<body>

<div id="wrap">
	<br><br>
	회원정보 Content(이용자 및 관리자-조건에 따라 달리 나타나게 함)
	<br><br>
	
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용 -->
	<!-- 파라미터(값) 전송은 post방식, 전송할 페이지는 joinOk.jsp -->
	
		<table>
		<div class="admin">
 
			<tr>
				<td> 회원등급</td>
				<td>
					<%=vo.getMgrade() %>																
				</td>
			</tr>
			
			<tr>
				<td> 회원번호</td>
				<td>					 
					<%=vo.getMidx() %>				
				</td>
			</tr>
			
			<tr>
				<td> 아이디</td>
				<td>					
					<%=vo.getMid() %>				
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>				
					<%=vo.getMpwd()%>
				</td>
			</tr>			
			
			<tr>
				<td> 이름 </td>
				<td>
					<%=vo.getMname() %>
				</td>
			</tr>
			
			<tr>
				<td> 생년월일 </td>
				<td>
					<%=vo.getMbirth() %>					
				</td>
			</tr>
			
			<tr>
				<td> 핸드폰 번호</td>
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
				<td>우편번호</td>
				<td>				
					<%=vo.getMpost()%>				
				</td>
			</tr>
			
			<tr>
				<td>주소1</td>
				<td>					
					<%=vo.getMaddr1() %>
				</td>
			</tr>
			
			<tr>
				<td>주소2</td>	
				<td>					
					<%=vo.getMaddr2() %>
				</td>
			</tr>			
			
			<tr>
				<td>가입날짜</td>	
				<td>					
					<%=vo.getMenter() %>
				</td>
			</tr>
			
			<tr>
				<td>수정날짜</td>	
				<td>					
					<%=vo.getMmdate() %>
				</td>
			</tr>
			
			<tr>
				<td>탈퇴날짜</td>	
				<td>					
					<%=vo.getMbreakdate() %>
				</td>
			</tr>
			
			<tr>
				<td>총 마일리지</td>	
				<td>					
					<%=vo.getMpoint() %>
				</td>
			</tr>
			
			<div>			
	  			<input class="btn btn-default" id="DeleteButton" type="button" value="탈퇴" onclick="de()"/>
	  			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller.member/MemberModifyServlet.do?midx=<%=midx %>">수정</a>	  			
	  			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/MemberListServlet.do">취소</a>
  			</div>	
  		
		</div>
<!-- 		
		<div class="guest">
			<tr>
				<td> 아이디</td>
				<td>					
								
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>
					<input type="password" name="pwd" maxlength="100"
						
				</td>
			</tr>			
			
			<tr>
				<td> 이름 </td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<td> 생년월일 </td>
				<td>
								
				</td>
			</tr>
			
			<tr>
				<td> 핸드폰 번호</td>
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
				<td>우편번호</td>
				<td>
					<input type="text" name="post" maxlength="20"
						value=>
					<input type="button" value="우편번호 검색">
				</td>
			</tr>
			
			<tr>
				<td>주소1</td>
				<td>
					<input type="text" name="addr1" maxlength="500"
						value=>
				</td>
			</tr>
			
			<tr>
				<td>주소2</td>	
				<td>
					<input type="text" name="addr2" maxlength="500"
						value=>
				</td>
			</tr>			
			
			<tr>
				<td>총 마일리지</td>	
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